#!/bin/bash

chmod 755 if-gt.sh

read NUM
if [ $NUM -gt 0 ]
then echo true
fi
