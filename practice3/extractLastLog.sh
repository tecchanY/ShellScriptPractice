#!/bin/bash

chmod +x extractLastLog.sh

LINENUM=0 #開始行
COMMAND=`tail -n +$LINENUM log_example.txt` #-nコマンドで出力する行数を指定
LINEDATA="" #1行分を格納する変数
FIRSTROW=true #開始行フラグ

while read line
do
  if ${FIRSTROW}
  then
    LINEDATA=${line}
    FIRSTROW=false
    continue
  fi

  if [[ $line =~ START ]]
  then
    #ログの開始行は何もしない
    continue
  elif [[ $line =~ END]]
  then
    #ログの終了行
    #sed -eでスクリプト追加し、cutの-dオプションで区切り文字の指定、-fオプションで何項目目を表示するか指定
    result=$(echo ${line} | sed -e "s/^.*(\(.*\))/\1/g" | cut -d `,` -f 1) #カッコ内を抽出しカンマ区切りの1つ目を取得
    #ログから何も取得できなかったとき、
    if [[ $result == 0 ]]
    then
      IFS_ORIGINAL=${IFS}
      IFS=, #環境変数の区切り文字をカンマに変更
      columns=$(echo ${LINEDATA} | sed -e "s/^.*(\(.*\))/\1/g") #カンマ区切りを代入するとそのまま配列扱いになる
      IFS=${IFS_ORIGINAL} #環境変数IFSを元々の区切り文字に戻す
      for v in ${columns[@]}
        #文字列長のオプションで-nだと文字列長が0より大きいなら真。-zは文字列長が0なら真
        do echo -n ${v}\;
      done
      echo
    fi
  else
    #開始行でも終了行でもなければ行を変数に代入
    LINEDATA=${line}
  fi

#ヒアドキュメントとしてCOMMAND
done << EOF
  ${COMMAND}
EOF

# 開始行は都度変えるようにしたいので変数に
# 開始終了ログに挟まれたログのカッコ内の文字を抽出する
# 抽出したカッコ内の文字はカンマ区切りなので、分割して配列へ
