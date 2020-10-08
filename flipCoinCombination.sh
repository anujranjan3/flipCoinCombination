#!/bin/bash -x

declare -A coinDict;

HH=0;
HT=0;
TH=0;
TT=0;

headTailGenerator () {
local counter=0;
local DictCounter=0;
while [ $counter -lt $FlipCount ]
do
randomNum=$((RANDOM%2));

if [ $randomNum -eq 1 ]
then
	randomNum1=$((RANDOM%2));
	if [ $randomNum1 -eq 1 ]
	then
		coinDict[$DictCounter]="$randomNum$randomNum1";
		echo "It's HH";
		(( counter++ ));
		(( DictCounter ++ ));
	else
		coinDict[$DictCounter]="$randomNum$randomNum1";
      echo "It's HT";
      (( counter++ ));
      (( DictCounter ++ ));
	fi
else
	randomNum1=$((RANDOM%2));
	if [ $randomNum1 -eq 1 ]
	then
		coinDict[$DictCounter]="$randomNum$randomNum1";
      echo "It's TH";
      (( counter++ ));
      (( DictCounter ++ ));
	else
		coinDict[$DictCounter]="$randomNum$randomNum1";
      echo "It's TT";
      (( counter++ ));
      (( DictCounter ++ ));
	fi
fi
done
}

calculatePercantage () {
	local counter=0;

	while [ $counter -lt $FlipCount ]
	do
		if [ ${coinDict[$counter]} == "11" ]
		then
			(( HH++ ));
		elif [ ${coinDict[$counter]} == "10" ]
		then
			(( HT++ ));
		elif [ ${coinDict[$counter]} == "01" ]
		then
			(( TH++ ));
		elif [ ${coinDict[$counter]} == "00" ]
		then
			(( TT++ ));
		fi
		(( counter++ ));
	done

	echo "Showing all elements dictionary : "${coinDict[@]};

	echo "Calculating Percentage of HH --";
	HHPercent=$((($HH*100)/$FlipCount));
	echo "Percentage of HH : " $HHPercent;

	echo "Calculating Percentage of HT --";
   HTPercent=$((($HT*100)/$FlipCount));
   echo "Percentage of HT : " $HTPercent;

	echo "Calculating Percentage of TH --";
   THPercent=$((($TH*100)/$FlipCount));
   echo "Percentage of TH : " $THPercent;

	echo "Calculating Percentage of TT --";
   TTPercent=$((($TT*100)/$FlipCount));
   echo "Percentage of TT : " $TTPercent;

}

coinMain () {

	read -p "Enter number of times you want to flip coin " FlipCount;
	headTailGenerator $FlipCount;
	calculatePercantage $FlipCount;

}

coinMain;
