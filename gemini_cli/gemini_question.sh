#!/bin/bash

# Verifica si se proporcionó un parámetro
if [ -z "$1" ]; then
  # Si no se proporciona un argumento, mostrar un mensaje de uso en un cuadro de diálogo
  if command -v zenity &> /dev/null; then
    zenity --error --title="Gemini CLI Error" --text="Uso: gemini <tu_pregunta>"
  else
    echo "Uso: $0 <tu_pregunta>"
  fi
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


# Realiza la solicitud curl, captura la salida JSON y extrae el texto con jq
RESPONSE_TEXT=$(curl -s "${API_URL}" \
  -H 'Content-Type: application/json' \
  -X POST \
  -d "${JSON_PAYLOAD}" | jq -r '.candidates[0].content.parts[0].text')

# Verifica si se pudo obtener una respuesta
if [ -z "$RESPONSE_TEXT" ]; then
    RESPONSE_TEXT="No se pudo obtener una respuesta de Gemini o hubo un error."
fi


# Muestra la respuesta en una ventana de texto emergente con Zenity
if command -v zenity &> /dev/null; then
    # Usamos --text-info para una ventana con scroll si el texto es largo
    echo "${RESPONSE_TEXT}" | zenity --text-info --width=600 --height=400 --title="Respuesta de Gemini" --no-wrap --no-markup
else
    # Fallback si Zenity no está disponible
    echo "Respuesta de Gemini: ${RESPONSE_TEXT}"
    echo "Consejo: Instala 'zenity' (e.g., sudo apt install zenity) para ver las respuestas en una ventana."
fi
