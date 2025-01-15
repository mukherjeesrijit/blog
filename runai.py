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

print(code_writer_agent_system_message)

import datetime

message = f"Create a dataset image with labels"\
"Create a demo dataset class for training a convolutional neural network."\
"Then build a code for training and validation with 80-20 split."\
"Make sure that you show the confusion matrix on the validation dataset."\
"Make sure the code is in python code block and save the figure"\
"to a file named cfmatrix.png."""

chat_result = code_executor_agent.initiate_chat(
    code_writer_agent,
    message=message,
)

import os
from IPython.display import Image

Image(os.path.join("coding", "cfmatrix.png"))