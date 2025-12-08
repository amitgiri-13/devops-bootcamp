#!/bin/bash

for file in `ls /home/$USER`
do
	cat $file
done
