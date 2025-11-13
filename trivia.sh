#!/usr/bin/env bash
# Juego: Trivia de preguntas
# Autor: Rosalia Z.J.

# Preguntas y respuestas
QUESTIONS=("¿Cuál es la capital de Francia?" "¿Cuántos planetas hay en el sistema solar?" "¿Qué lenguaje usamos para este juego?" "¿Qué sistema de control de versiones usamos?" "¿Quién descubrió América?")
ANSWERS=("paris" "8" "bash" "git" "colón")

# Variables del juego
SCORE=0
TOTAL=${#QUESTIONS[@]}

echo "🧠 Bienvenido a la Trivia de preguntas!"
echo "Responde las preguntas correctamente para ganar puntos."

# Bucle de preguntas
for ((i=0; i<$TOTAL; i++)); do
  echo
  echo "Pregunta $((i+1)) de $TOTAL:"
  echo "${QUESTIONS[$i]}"
  read -p "Tu respuesta: " ANSWER
  # Convertir a minúsculas
  ANSWER=${ANSWER,,}
  
  if [[ "$ANSWER" == "${ANSWERS[$i]}" ]]; then
    echo "✅ ¡Correcto!"
    ((SCORE++))
  else
    echo "❌ Incorrecto. La respuesta correcta era: ${ANSWERS[$i]}"
  fi
done

echo
echo "🎉 Terminaste la trivia. Tu puntaje: $SCORE/$TOTAL"
