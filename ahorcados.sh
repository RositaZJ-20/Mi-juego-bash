#!/usr/bin/env bash
# Juego del Ahorcado en Bash
# Autor: Rosalia Z.J.

# Lista de palabras posibles
WORDS=("bash" "linux" "terminal" "script" "github" "computadora" "programacion" "juego" "ahorcado" "codigo")

# Elegir una palabra al azar
WORD=${WORDS[$RANDOM % ${#WORDS[@]}]}

# Variables del juego
TRIES=6
GUESS_STATE=$(echo "$WORD" | sed 's/./_/g')
GUESSED_LETTERS=""

# Dibuja el ahorcado según los intentos
draw_hangman() {
  case $1 in
    6) echo -e "\n  +---+\n  |   |\n      |\n      |\n      |\n      |\n=========" ;;
    5) echo -e "\n  +---+\n  |   |\n  O   |\n      |\n      |\n      |\n=========" ;;
    4) echo -e "\n  +---+\n  |   |\n  O   |\n  |   |\n      |\n      |\n=========" ;;
    3) echo -e "\n  +---+\n  |   |\n  O   |\n /|   |\n      |\n      |\n=========" ;;
    2) echo -e "\n  +---+\n  |   |\n  O   |\n /|\\  |\n      |\n      |\n=========" ;;
    1) echo -e "\n  +---+\n  |   |\n  O   |\n /|\\  |\n /    |\n      |\n=========" ;;
    0) echo -e "\n  +---+\n  |   |\n  O   |\n /|\\  |\n / \\  |\n      |\n=========" ;;
  esac
}

# Actualiza el estado de la palabra
update_guess_state() {
  local new_state=""
  for ((i=0; i<${#WORD}; i++)); do
    if [[ "${WORD:$i:1}" == "$1" ]]; then
      new_state="${new_state}${1}"
    else
      new_state="${new_state}${GUESS_STATE:$i:1}"
    fi
  done
  GUESS_STATE=$new_state
}

# Bucle principal del juego
while [[ $TRIES -gt 0 ]]; do
  draw_hangman $TRIES
  echo
  echo "Palabra: $GUESS_STATE"
  echo "Letras intentadas: $GUESSED_LETTERS"
  echo "Intentos restantes: $TRIES"
  echo
  read -p "Ingresa una letra: " LETTER

  # Verifica si la letra ya fue usada
  if [[ $GUESSED_LETTERS == *"$LETTER"* ]]; then
    echo "Ya usaste esa letra. Intenta con otra."
    continue
  fi

  GUESSED_LETTERS+="$LETTER "

  # Verifica si la letra está en la palabra
  if [[ $WORD == *"$LETTER"* ]]; then
    echo "¡Bien hecho! La letra '$LETTER' está en la palabra."
    update_guess_state "$LETTER"
  else
    echo "Letra incorrecta 😢"
    ((TRIES--))
  fi

  # Verifica si ganó
  if [[ "$GUESS_STATE" == "$WORD" ]]; then
    echo
    echo "🎉 ¡Felicidades! Adivinaste la palabra: $WORD"
    exit 0
  fi
done

# Si perdió
draw_hangman 0
echo
echo "😵 Te quedaste sin intentos. La palabra era: $WORD"
