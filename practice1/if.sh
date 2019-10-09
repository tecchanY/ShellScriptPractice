#!/bin/sh

# å¼•æ•°ã‚’æŒ‡å®šã—ã¦å®Ÿè¡?

if [ "$1" -gt "$2" ]
then
  echo "1”Ô–Ú‚Ìˆø”‚ª2”Ô–Ú‚Ìˆø”‚æ‚è‘å‚«‚¢"
elif [ "$1" -eq "$2" ]
then
  echo "1”Ô–Ú‚Ìˆø”‚Æ2”Ô–Ú‚Ìˆø”‚Í“¯‚¶‚Å‚·"
else
  echo "1”Ô–Ú‚Ìˆø”‚ª2”Ô–Ú‚Ìˆø”‚æ‚è¬‚³‚¢"
fi
