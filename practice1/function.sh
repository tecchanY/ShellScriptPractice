#!/bin/bash

# 関数の指定
MyFunction () {
  echo "関数のecho"
}
MyparamFunc () {
  echo "引数1:$1 引数2:$2"
}

# 関数の呼び出し
MyFunction
MyparamFunc param1 param2
