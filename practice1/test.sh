#!/usr/bin/bash
#chmod 755 testscript.sh

# read NAME
# echo "Hello, $NAME!"

# echo -e "Hello\n$NAME!"

var="これは変数"
VaR_2="これも変数"
echo "Var_2=$VaR_2"

VaR_2="VaR_2が変更されました"
echo ${VaR_2}

readonly var
var="readonly varを変更"
