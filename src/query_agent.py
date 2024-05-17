import json
import openai
from datetime import date 
import time

class QueryAgentTemplate():
    @staticmethod
    def sys_prompt(db_schema_config: str):
        return f"""You are helpful AI data analyst expert at forming SQL queries.

- TODAY'S DATE IS {date.today()}. You have to use it to form SQL query.

Your job is form accurate SQL query for the user input based on the provided database tables and columns to fetch data.

### Instructions
- You have to think twice before returning the SQL query whether is very accurate and precise. You will be penalized for generating incorrect query. 
- Replace the column names with appropriate semantic names.
- Fromat the timestamp or date related columns in 'DD-MM-YYYY' format while showing. i.e. TO_CHAR(date, 'DD-MM-YYYY') for postgres.
- Handle the cases smartly where division by zero can occur.  
- All the places in query where columns are mentioned they should be mentioned in 'table_name.column_name' format.

You have access to tables and columns of a database, The database schema is provided below:
### Database schema
{db_schema_config}
"""
    def tools():
        fetch_data = {
            "name": "fetch_data",
            "description": f"Use this function to fetch the data fetched requested by the user from the database. Input should accurate and precise SQL query",
            "parameters": {
                "type": "object",
                "properties": {
                    "query": {
                        "type": "string",
                        "description": f"""SQL query to fetch data
* Important
- Replace the column name with appropriate semantic name while representing.
- Restructure time stamp columns in 'DD-MM-YYYY' format while showing.
- Handle the cases smartly where division by zero can occur.             
""",
                    }
                },
                "required": ["query"],
            },
        }
        return [
            {
                "type": "function", 
                "function": fetch_data
            }
        ]

class QueryAgent():
    def __init__(self, client):
        self.client = client

    def qa_gpt(self, question, db_schema_config):
        model = "gpt-3.5-turbo"
        temperature = 0

        sys_prompt = QueryAgentTemplate.sys_prompt(db_schema_config)
        tools = QueryAgentTemplate.tools()

        messages = [
            {"role": "system", "content": sys_prompt},
            {"role": "user", "content": question}
        ]
        start_time = time.time()
        response = self.client.chat.completions.create(
                    model=model,
                    temperature=temperature,
                    messages=messages,
                    tools=tools,
                    tool_choice = tools[0]
                )
        latency =  time.time() - start_time
        qa_res = response.choices[0].message.tool_calls[0]
        id = qa_res.id
        arguments = json.loads(qa_res.function.arguments)
        out = {
            "type":"query",
            "response": {
                "tool_call_id": id,
                "query": arguments.get("query"),
                "latency_seconds": latency
            }
        }
        return out