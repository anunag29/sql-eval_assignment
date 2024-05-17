from typing import Optional
import pandas as pd


def prepare_questions_df(
    questions_file: str,
    db_type: str = "postgres",
    num_questions: Optional[int] = None,
):
    question_query_df = pd.read_csv(questions_file, nrows=num_questions)
    question_query_df["db_type"] = db_type
    question_query_df["generated_query_1"] = ""
    question_query_df["generated_query_2"] = ""
    question_query_df["exact_match_1"] = 0
    question_query_df["exact_match_2"] = 0
    question_query_df["correct_1"] = 0
    question_query_df["correct_2"] = 0
    question_query_df["latency_seconds_1"] = 0.0  # latency of query generation in seconds
    question_query_df["latency_seconds_2"] = 0.0  # latency of query generation in seconds
    question_query_df["latency_seconds_extract_tables"] = 0.0
    question_query_df["err_1"] = 0
    question_query_df["error_msg_1"] = ""
    question_query_df["err_2"] = 0
    question_query_df["error_msg_2"] = ""
    question_query_df["extracted_tables"] = ""

    question_query_df.reset_index(inplace=True, drop=True)


    return question_query_df
