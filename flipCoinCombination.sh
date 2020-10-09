#!/bin/bash -x

declare -A coinDict;

headTailGenerator () {
local counter=0;
local DictCounter=0;
while [ $counter -lt $FlipCount ]
do
randomNum=$((RANDOM%2));

if [ $randomNum -eq 1 ]
then
	coinDict[$DictCounter]="$randomNum";
   echo "It's Heads";
	(( counter++ ));
   (( DictCounter ++ ));

	randomNum1=$((RANDOM%2));
	if [ $randomNum1 -eq 1 ]
	then
		coinDict[$DictCounter]="$randomNum$randomNum1";
      echo "It's HH";
		(( counter++ ));
      (( DictCounter ++ ));

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
		coinDict[$DictCounter]="$randomNum$randomNum1";
      echo "It's HT";
		(( counter++ ));
      (( DictCounter ++ ));

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
	coinDict[$DictCounter]="$randomNum";
   echo "It's Tails";
	(( counter++ ));
   (( DictCounter ++ ));

	randomNum1=$((RANDOM%2));
	if [ $randomNum1 -eq 1 ]
	then
		coinDict[$DictCounter]="$randomNum$randomNum1";
      echo "It's TH";
		(( counter++ ));
      (( DictCounter ++ ));

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
		coinDict[$DictCounter]="$randomNum$randomNum1";
      echo "It's TT";
		(( counter++ ));
      (( DictCounter ++ ));

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

storingArray () {
	for (( i=0; i<$FlipCount; i++ ))
	do
	temp=${coinDict[$i]};
	coinArray[i]=$temp
	done
	echo ${coinArray[*]};
}

sorting () {
	for (( j=0; j<$FlipCount; j++ ))
	do
		for (( k=$j+1; k<$FlipCount; k++ ))
		do
			if [ ${coinArray[j]} -gt ${coinArray[k]} ]
			then
				temp=${coinArray[j]};
				coinArray[j]=${coinArray[k]};
				coinArray[k]=$temp;
			fi
		done
	done
}

winningComb () {
	local counter=0;
	local winCounter=0;

	while [ $counter -lt $FlipCount ]
	do
		if [ ${coinDict[$counter]} == "111" ]
		then
			winArray[winCounter]=${coinDict[$counter]};
			(( winCounter++ ));
		elif [ ${coinDict[$counter]} == "11" ]
		then
			winArray[winCounter]=${coinDict[$counter]};
			(( winCounter++ ));
		elif [ ${coinDict[$counter]} == "1" ]
		then
			winArray[winCounter]=${coinDict[$counter]};
			(( winCounter++ ));
		fi
		(( counter++ ));
	done

	echo "Showing all winning Combinations : "${winArray[*]};
}

coinMain () {

	read -p "Enter number of times you want to flip coin " FlipCount;
	headTailGenerator $FlipCount;
	storingArray $FlipCount;
	sorting $FlipCount;
	echo "Sorted Combination in array "${coinArray[*]};
	winningComb $FlipCount;

}

coinMain;
