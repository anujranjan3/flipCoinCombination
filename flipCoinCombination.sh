#!/bin/bash -x

randomNum=$((RANDOM%2));
if [ $randomNum -eq 0 ];
then
	echo "It's Tails";
else
	echo "It's Heads";
fi
