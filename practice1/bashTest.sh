#!/bin/bash

#bash shellで配列の書き方
ARRAY=(item1 item2 item3 item4)
ARRAY[0]="ITEM1"
ARRAY[2]="ITEM3"

echo "ARRAY[0]: ${ARRAY[0]}"
echo "ARRAY[1]: ${ARRAY[1]}"

#全てのアイテムにアクセスする
echo "ARRAY[*]: ${ARRAY[*]}"
echo "ARRAY[@]: ${ARRAY[@]}"

# 4行目でunexpected "("という謎エラーに当たって解決できず。
# １．先頭を#!/bin/bashにする、２．実行時に./やshではなくbash ファイル名とする、という2つの方法を試したが解決できず
# busyboxが原因かと思ったが、busyboxはシェルを用意しているだけのはず。。。
# ⇒helpでビルトインコマンド一覧を見たら見たところbashコマンドはなかったので、少なくともbusybox上ではbashコマンドは利用できないことがわかった。
