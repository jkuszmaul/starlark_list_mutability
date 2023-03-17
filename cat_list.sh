#!/bin/bash

for FILE in $@
do
  echo $FILE
  cat $FILE
done
