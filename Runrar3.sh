#!/bin/bash

for g in `find $1 -wholename *.rar`
do
   cd `dirname $g`
   /usr/bin/runrar.sh
done

