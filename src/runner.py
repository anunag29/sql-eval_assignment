import json
import copy
import os

import pandas as pd
from tqdm import tqdm
from openai import OpenAI

from .eval import compare_query_results
from .query_agent import QueryAgent
from .extract_tables import SchemaExtractorAgent

from utils.questions import prepare_questions_df
from utils.creds import db_creds_all
from utils.db_schema_config import db_schema_config



def run_eval(args):
    client = OpenAI(api_key = os.getenv('OPENAI_API_KEY'))
    
    questions_file = args.questions_file
    output_file = args.output_file
    num_questions = args.num_questions
    db_type = args.db_type

    question_query_df = prepare_questions_df(questions_file, db_type, num_questions)

    input_rows = question_query_df.to_dict("records")

    output_rows = []
    
    query_agent = QueryAgent(client=client)

    table_extract_agent = SchemaExtractorAgent(client=client, db_schema_config=db_schema_config)
    

    print("Running text-to-SQL engine.....")

    for idx in tqdm(tqdm(range(len(input_rows)))):
        row = input_rows[idx]
        
        #approach1 i.e without extracting relevant tables
        response_app1 = query_agent.qa_gpt(row["question"], db_schema_config)
        row["generated_query_1"] = response_app1["response"]["query"]
        row["latency_seconds_1"] = response_app1["response"]["latency_seconds"]

        #approach2 i.e running query after extracting relevant tables
        extract_table_response = table_extract_agent.extract_schemas(row["question"])
        row["latency_seconds_extract_tables"] = extract_table_response["latency"]
        row["extracted_tables"] = extract_table_response["relevant_tables"]
        response_app2 = query_agent.qa_gpt(row["question"], row["extracted_tables"])
        row["generated_query_2"] = response_app2["response"]["query"]
        row["latency_seconds_2"] = response_app2["response"]["latency_seconds"]
        
    print("Starting SQL-Evaluation.....")
    total_tried = 0
    total_correct_1 = 0
    total_correct_2 = 0
    latencies = [0,0,0]

    for idx in tqdm(tqdm(range(len(input_rows)))):
        total_tried+=1
        row = input_rows[idx]

        #Evaluating Approach 1
        query_gen_1 = row["generated_query_1"]
        latency_1 = row["latency_seconds_1"]
        try:
            exact_match_1, correct_1 = compare_query_results(
                query_gold=row["query"],
                query_gen=query_gen_1,
                db_name=row["db_name"],
                db_type=db_type,
                db_creds=copy.deepcopy(db_creds_all["postgres"]),
                # timeout=args.timeout_exec,
                question=row["question"],
                query_category="all",
                table_metadata_string="",
                # decimal_points=args.decimal_points,
            )

            row["exact_match_1"] = int(exact_match_1)
            row["correct_1"] = int(correct_1)
            if correct_1:
                total_correct_1 += 1
            # print("Success")
        except Exception as e:
            row["err_1"] = 1
            row["error_msg_1"] = f"Error {e}"
            # print("Failed")


        #Evaluating Approach 2
        query_gen_2 = row["generated_query_2"]
        latency_2 = row["latency_seconds_2"]
        try:
            exact_match_2, correct_2 = compare_query_results(
                query_gold=row["query"],
                query_gen=query_gen_2,
                db_name=row["db_name"],
                db_type=db_type,
                db_creds=copy.deepcopy(db_creds_all["postgres"]),
                # timeout=args.timeout_exec,
                question=row["question"],
                query_category="all",
                table_metadata_string="",
                # decimal_points=args.decimal_points,
            )

            row["exact_match_2"] = int(exact_match_2)
            row["correct_2"] = int(correct_2)
            if correct_2:
                total_correct_2 +=1
            # print("Success")
        except Exception as e:
            row["err_2"] = 1
            row["error_msg_2"] = f"Error {e}"
            # print("Failed")
        
        latencies[0] += latency_1
        latencies[1] += latency_2
        latencies[2] += row["latency_seconds_extract_tables"]

        output_rows.append(row)
    


    print(f"Accuracy for Approach 1 = {100.0*total_correct_1/total_tried} %")
    print(f"Accuracy for Approach 2 = {100.0*total_correct_2/total_tried} %")

    print(f"Average Latency(in sec) for Approach 1 = {latencies[0]/20.0}")
    print(f"Average Latency(in sec) for Approach 2 = {latencies[1]/20.0}")
    print(f"Average Latency(in sec) for Approach 2 (for extracting relevant tables) = {latencies[2]/20.0}")    

    output_df = pd.DataFrame(output_rows)
    output_df.to_csv(f"{output_file}.csv", index=False)
