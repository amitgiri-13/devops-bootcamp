#!/bin/bash

# bash style
for arg in `seq 1 4`		# or $(seq 1 4) 
do
	echo $arg
	touch test.$arg
done



# c style
for (( arg = 0; arg <= 4; arg ++ ))
do
	echo hi
done
