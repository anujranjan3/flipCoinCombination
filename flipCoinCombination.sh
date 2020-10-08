#!/bin/bash -x

declare -A coinDict;

HHH=0;
HHT=0;
HTH=0;
HTT=0;
THH=0;
THT=0;
TTH=0;
TTT=0;

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
		randomNum2=$((RANDOM%2));
		if [ $randomNum2 -eq 1 ]
		then
			coinDict[$DictCounter]="$randomNum$randomNum1$randomNum2";
			echo "It's HHH";
			(( counter++ ));
			(( DictCounter ++ ));
		else
			coinDict[$DictCounter]="$randomNum$randomNum1$randomNum2";
      		echo "It's HHT";
      		(( counter++ ));
      		(( DictCounter ++ ));
		fi
	else
		randomNum2=$((RANDOM%2));
		if [ $randomNum2 -eq 1 ]
		then
			coinDict[$DictCounter]="$randomNum$randomNum1$randomNum2";
			echo "It's HTH";
			(( counter++ ));
			(( DictCounter ++ ));
		else
			coinDict[$DictCounter]="$randomNum$randomNum1$randomNum2";
      		echo "It's HTT";
      		(( counter++ ));
      		(( DictCounter ++ ));
		fi
	fi
else
	randomNum1=$((RANDOM%2));
	if [ $randomNum1 -eq 1 ]
	then
		randomNum2=$((RANDOM%2));
		if [ $randomNum2 -eq 1 ]
		then
			coinDict[$DictCounter]="$randomNum$randomNum1$randomNum2";
			echo "It's THH";
			(( counter++ ));
			(( DictCounter ++ ));
		else
			coinDict[$DictCounter]="$randomNum$randomNum1$randomNum2";
      		echo "It's THT";
      		(( counter++ ));
      		(( DictCounter ++ ));
		fi
	else
		randomNum2=$((RANDOM%2));
		if [ $randomNum2 -eq 1 ]
		then
			coinDict[$DictCounter]="$randomNum$randomNum1$randomNum2";
			echo "It's TTH";
			(( counter++ ));
			(( DictCounter ++ ));
		else
			coinDict[$DictCounter]="$randomNum$randomNum1$randomNum2";
      		echo "It's TTT";
      		(( counter++ ));
      		(( DictCounter ++ ));
		fi
	fi
fi
done
}

calculatePercantage () {
	local counter=0;

	while [ $counter -lt $FlipCount ]
	do
		if [ ${coinDict[$counter]} == "111" ]
		then
			(( HHH++ ));
		elif [ ${coinDict[$counter]} == "110" ]
		then
			(( HHT++ ));
		elif [ ${coinDict[$counter]} == "101" ]
		then
			(( HTH++ ));
		elif [ ${coinDict[$counter]} == "100" ]
		then
			(( HTT++ ));
		elif [ ${coinDict[$counter]} == "011" ]
		then
			(( THH++ ));
		elif [ ${coinDict[$counter]} == "010" ]
		then
			(( THT++ ));
		elif [ ${coinDict[$counter]} == "001" ]
		then
			(( TTH++ ));
		elif [ ${coinDict[$counter]} == "000" ]
		then
			(( TTT++ ));
		fi
		(( counter++ ));
	done

	echo "Showing all elements dictionary : "${coinDict[@]};

	echo "Calculating Percentage of HHH --";
	HHHPercent=$((($HHH*100)/$FlipCount));
	echo "Percentage of HHH : " $HHHPercent;

	echo "Calculating Percentage of HHT --";
    HHTPercent=$((($HHT*100)/$FlipCount));
    echo "Percentage of HHT : " $HHTPercent;

	echo "Calculating Percentage of HTH --";
    HTHPercent=$((($HTH*100)/$FlipCount));
    echo "Percentage of HTH : " $HTHPercent;

	echo "Calculating Percentage of HTT --";
    HTTPercent=$((($HTT*100)/$FlipCount));
    echo "Percentage of HTT : " $HTTPercent;

    echo "Calculating Percentage of THH --";
	THHPercent=$((($THH*100)/$FlipCount));
	echo "Percentage of THH : " $THHPercent;

	echo "Calculating Percentage of THT --";
    THTPercent=$((($THT*100)/$FlipCount));
    echo "Percentage of THT : " $THTPercent;

	echo "Calculating Percentage of TTH --";
    TTHPercent=$((($TTH*100)/$FlipCount));
    echo "Percentage of TTH : " $TTHPercent;

	echo "Calculating Percentage of TTT --";
    TTTPercent=$((($TTT*100)/$FlipCount));
    echo "Percentage of TTT : " $TTTPercent;

}

coinMain () {

	read -p "Enter number of times you want to flip coin " FlipCount;
	headTailGenerator $FlipCount;
	calculatePercantage $FlipCount;

}

coinMain;
