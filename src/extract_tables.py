import json 
import time


class SchemaExtractorAgentTemplate():
    @staticmethod
    def sys_prompt(db_schema_config: str):
        return f"""You are a helpful AI data analyst expert at extracting relevant table schemas based on a user's question.

Your job is to identify and extract relevant table schemas from the provided database schema based on the user input.

### Instructions
- Carefully read the user's question to understand what information they are seeking.
- Review the provided database schema and identify the tables that contain relevant information and give the complete table schema.
- Extract and provide only the relevant table schemas, including all columns and their types, constraints, and other details in the same structure as provided.

### Table schema example for your reference 

'CREATE TABLE schedule_respondents (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
schedule_id bigint,
respondent_id bigint
);

CREATE TABLE tabel2 (
id bigint,
created_at timestamp without time zone,
updated_at timestamp without time zone,
schedule_id bigint,
template_id bigint
);'


You have access to the database tables and columns. The database schema is provided below:
### Database schema
{db_schema_config}
"""
    @staticmethod
    def tools():
        extract_relevant_schemas = {
            "name": "extract_relevant_schemas",
            "description": "Use this function to extract relevant table schemas based on the user's question. Input should be accurate and precise based on the user's query.",
            "parameters": {
                "type": "object",
                "properties": {
                    "schemas": {
                        "type": "string",
                        "description": "Extracted table schemas relevant to the user's question."
                    }
                },
                "required": ["schemas"],
            },
        }
        return [
            {
                "type": "function",
                "function": extract_relevant_schemas
            }
        ]

class SchemaExtractorAgent():
    def __init__(self, client, db_schema_config):
        self.db_schema_config = db_schema_config
        self.client = client

    def extract_schemas(self, question):
        model = "gpt-3.5-turbo"
        temperature = 0

        sys_prompt = SchemaExtractorAgentTemplate.sys_prompt(self.db_schema_config)
        tools = SchemaExtractorAgentTemplate.tools()

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
        tool_response = response.choices[0].message.tool_calls[0]
        arguments = json.loads(tool_response.function.arguments)
        extracted_schemas = arguments.get("schemas")
        return { "relevant_tables" : extracted_schemas, "latency" : latency}