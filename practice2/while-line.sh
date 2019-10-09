#!/bin/bash

chmod 755 while-line.sh

# 実行結果はcat while.shと同じ
while read line
do echo "$line"
done < while.sh
