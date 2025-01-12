#!/bin/bash

words=$(<text.txt)

declare -A count

while IFS=' ' read -ra ADDR; do
	for i in "${ADDR[@]}"; do
		if [ ! -v count[$i] ];
		then
			count[$i]=$((0));
		fi
		count[$i]=$((count[$i] + 1));
	done
done <<< $words

for key in "${!count[@]}"; do
	echo "$key ${count[$key]}"
done

