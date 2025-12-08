#!/bin/bash
read counter
while [ $counter -gt 0 ]
do
	let counter--
	echo $counter
done
