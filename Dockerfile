FROM ollama/ollama

WORKDIR /app
COPY ollama.ini.sh .
RUN chmod +x /app/ollama.ini.sh
