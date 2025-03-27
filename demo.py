import requests


model_name = "llama3.1:8b"
ollama_host = "http://localhost:11434"
num_ctx = 130000
temperature = 0.2

prompt = """
dime un chiste de padel
"""


response = requests.post(
    f"{ollama_host}/api/generate",
    json={
        "model": model_name,
        "prompt": prompt,
        "stream": False,
        "format": "json",
        "options": {  # * More options avaible ->
            # * Check the oficial ollama documentation: https://github.com/ollama/ollama/blob/main/docs/api.md
            "num_ctx": num_ctx,  # Context window // Number of prompt tokens
            "temperature": temperature,
        },
    },
)

print(response)



"""

docker-compose exec ollama bash

ollama run llama3.1:8b

dime un chiste de padel

"""