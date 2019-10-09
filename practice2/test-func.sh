#!/bin/bash

chmod 755 test-func.sh

function myfunc () {
  echo hello_world
}
myfunc

# 上記と同じ結果になる
func () {
  echo hello_world
}
func
