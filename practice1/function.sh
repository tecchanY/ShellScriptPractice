#!/bin/bash

# �֐��̎w��
MyFunction () {
  echo "�֐���echo"
}
MyparamFunc () {
  echo "����1:$1 ����2:$2"
}

# �֐��̌Ăяo��
MyFunction
MyparamFunc param1 param2
