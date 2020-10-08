#!/bin/bash -x

declare -A coinDict;

read -p "Enter number of times you want to flip coin " FlipCount;

counter=0;
DictCounter=0;
while [ $counter -lt $FlipCount ]
do
randomNum=$((RANDOM%2));
if [ $randomNum -eq 0 ];
then
	coinDict[$DictCounter]=$randomNum;
	echo "It's Tails";
	(( counter++ ));
	(( DictCounter ++ ));
else
	echo "It's Heads";
	(( counter++ ));
fi
done

echo "Calculating Percentage of Tails --";
echo "No Of Tails got : "${#coinDict[@]};
echo "Showing all elements dictionary : "${coinDict[@]};
tailPercent=$(((${#coinDict[@]}*100)/$FlipCount));
echo "Percentage of Tails : " $tailPercent;

echo "Calculating Percentage of Heads -";
headPercent=$((100-$tailPercent));
echo "Percentage of Heads : " $headPercent;
