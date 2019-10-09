#!/bin/sh

#文法	説明
# ${var}	変数値を入り変えます
# ${var:-word}	変数がまだセットされていないか空文字列の場合wordを返します。varに保存しません
# ${var:=word}	変数がまだセットされていないか空文字列の場合wordを返します。varに保存します
# ${var:?word}	変数がまだセットされていないか空文字列の場合置換に失敗し、スタンダードエラーにエラーを表示します
# ${var:+word}	変数がセットされている場合wordを返します。varに保存しません

echo "1 - ${var:-wordSetInEcho1}"
echo "2 - var = ${var}"
echo "3 - ${var:=wordSetInEcho3}"
echo "4 - var = ${var}"

unset var
echo "5 - ${var:+wordSetInEcho5}"
echo "6 - var = $var"

var="newVarValue"
echo "7 - ${var:+wordSetInEcho7}"
echo "8 - var = $var"
echo "9 - ${var:?StandardErrorMessage}"
echo "10 - var = ${var}"
