# Assignment README

## Introduction

This assignment focuses on improving the latency and accuracy of a text-to-SQL engine when dealing with a large number of tables in a database schema. The tasks involve building a flow to streamline the process and comparing the accuracy of two approaches: directly querying the engine and querying after extracting relevant tables.

## Creating Database

To create the database, follow these steps:

1. Execute the SQL script `HRTech_db_schema_config.sql` to set up the PostgreSQL database.
2. Make sure you have PostgreSQL installed and configured on your system.

## Adding Environment Variables

Before running the code, ensure the following environment variables are set:

- `OPENAI_API_KEY`: API key required for using OpenAI services.
- PostgreSQL authentication details: `username`, `password`, `host`, `port`.

## About Question - Query Pair Dataset

The `ideal20ques.csv` file contains a dataset consisting of ideal question-query pairs. It includes three columns: `question`, `query`, and `db_name`, with 20 entries.

## Running `main.py`

To run the code, use the following command-line arguments:

```bash
python main.py --output_file <output_file_name> --questions_file <path_to_ideal20ques.csv> --num_questions <number_of_questions> --db_type <database_type>
```

- `output_file`: Name of the output file to store the results.
- `questions_file`: Path to the `ideal20ques.csv` file.
- `num_questions` (optional, default = 20): Number of questions to evaluate.
- `db_type` (optional, default = postgres): Type of database being used (e.g., postgres, mysql).

## My Approach for Extracting Relevant Table Schema

I utilized a script called `extract_tables.py` to extract relevant table schemas based on the user's question. This script employs an AI agent designed to identify and extract relevant table schemas from a provided database schema, depending on the user input.

### Script Overview

The `extract_tables.py` script includes a class called `SchemaExtractorAgent`, which encapsulates the functionality for extracting table schemas. Here's a breakdown of its key components:

- **`sys_prompt` Method**: This method generates a system prompt instructing the AI agent on its task. It provides guidance on how to identify and extract relevant table schemas based on the user's question. The database schema configuration is included to help the agent understand the available tables and columns.
- **`tools` Method**: This method defines a tool called `extract_relevant_schemas`, which specifies the function for extracting relevant table schemas. It describes the input parameters required for the function, such as the schemas extracted from the database.
- **`extract_schemas` Method**: This method initiates the extraction process based on the user's question. It utilizes OpenAI's GPT-3.5 model to generate responses. The system prompt and user question are provided as input messages to the model. The tool defined in the `tools` method is used for extracting relevant schemas from the database based on the user query.

### Usage

To extract relevant table schemas, the `extract_schemas` method is called with the user's question as input. The method interacts with the GPT-3.5 model to generate a response containing the extracted schemas. Additionally, it measures the latency of the extraction process.

This approach streamlines the extraction of relevant table schemas, enhancing the efficiency and accuracy of the text-to-SQL engine.

## Results

The performance of both approaches was evaluated using the `sql-eval` framework. The results are summarized in the following image:

![Results](https://github.com/anunag29/sql-eval_assignment/blob/master/result.png)

The detailed output, including the generated SQL queries and their respective evaluations, can be found in the `output.csv` file:

[Download output.csv](https://github.com/anunag29/sql-eval_assignment/blob/master/output.csv)

This CSV file contains the results for the 20 questions, providing insights into the accuracy and efficiency of the query generation process.
