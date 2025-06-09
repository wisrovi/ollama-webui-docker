#!/bin/bash

# Verifica si se proporcionó un parámetro
if [ -z "$1" ]; then
  echo "Uso: $0 <tu_variable>"
  exit 1
fi

YOUR_VARIABLE="$1"

API_URL="https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyDSS1UlmYe7D_cxMv66Y5cAbU88tNN25W0"

JSON_PAYLOAD=$(cat <<EOF
{
  "contents": [
    {
      "parts": [
        {
          "text": "${YOUR_VARIABLE}"
        }
      ]
    }
  ]
}
EOF
)


curl -s "${API_URL}" \
  -H 'Content-Type: application/json' \
  -X POST \
  -d "${JSON_PAYLOAD}" | jq -r '.candidates[0].content.parts[0].text'
