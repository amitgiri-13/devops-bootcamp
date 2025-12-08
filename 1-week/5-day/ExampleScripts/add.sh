#!/bin/bash

re='^[0-9]+$'

function add {
	result=0

	for arg in "$@"
	do 
		if ! [[ "$arg" =~ $re ]]
	then
		echo "All agruments must be numbers"
		exit
	fi

	echo $arg
	result=$[[ $result + $arg ]] 
	echo  $result
 	done
}

if [ $# -gt 2 ]
then
	echo "$*"
	add $*
fi
