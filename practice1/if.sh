#!/bin/sh

# 引数を指定して実�?

if [ "$1" -gt "$2" ]
then
  echo "1�Ԗڂ̈�����2�Ԗڂ̈������傫��"
elif [ "$1" -eq "$2" ]
then
  echo "1�Ԗڂ̈�����2�Ԗڂ̈����͓����ł�"
else
  echo "1�Ԗڂ̈�����2�Ԗڂ̈�����菬����"
fi
