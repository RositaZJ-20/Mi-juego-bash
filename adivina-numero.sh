#!/usr/bin/env bash
# Juego: Adivina el número
# Autor: Rosalia Z.J.

# Número aleatorio entre 1 y 100
SECRET=$(( RANDOM % 100 + 1 ))
TRIES=0
GUESS=0

echo "🎯 Bienvenido al juego 'Adivina el número'!"
echo "He elegido un número entre 1 y 100. ¡Intenta adivinarlo!"

# Bucle principal del juego
while [[ $GUESS -ne $SECRET ]]; do
  read -p "Ingresa tu número: " GUESS
  ((TRIES++))

  if [[ $GUESS -lt $SECRET ]]; then
    echo "⬆ Muy bajo. Intenta un número más grande."
  elif [[ $GUESS -gt $SECRET ]]; then
    echo "⬇ Muy alto. Intenta un número más pequeño."
  else
    echo "🎉 ¡Felicidades! Adivinaste el número $SECRET en $TRIES intentos."
    exit 0
  fi
done
