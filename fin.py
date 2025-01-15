from autogen.coding import LocalCommandLineCodeExecutor
from autogen import ConversableAgent, AssistantAgent

# Setup API key. Add your own API key to config file or environment variable
llm_config = {
        "model": "llama3",
        "base_url": "http://localhost:11434/v1",
        'api_key': 'ollama',
    }
executor = LocalCommandLineCodeExecutor(
    timeout=60,
    work_dir="coding",
)

code_executor_agent = ConversableAgent(
    name="code_executor_agent",
    llm_config=False,
    code_execution_config={"executor": executor},
    human_input_mode="ALWAYS",
    default_auto_reply=
    "Please continue. If everything is done, reply 'TERMINATE'.",
)

code_writer_agent = AssistantAgent(
    name="code_writer_agent",
    llm_config=llm_config,
    code_execution_config=False,
    human_input_mode="NEVER",
)

code_writer_agent_system_message = code_writer_agent.system_message

import datetime

today = datetime.datetime.now().date()
message = f"Today is {today}. "\
"Create a plot showing stock gain YTD for NVDA and TLSA. "\
"Make sure the code is in markdown code block and save the figure"\
" to a file ytd_stock_gains.png."""

chat_result = code_executor_agent.initiate_chat(
    code_writer_agent,
    message=message,
)