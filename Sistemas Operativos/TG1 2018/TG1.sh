#!/bin/bash

IFS='
'
set -f

z=0

for i in $(find . -name "*.log")
do 
	a=$(awk '/^\$\$\$ End Body/ {print NR}' $i);
	awk -v b=$a -v d=$c -f TG1.awk $i >> output.txt
done





