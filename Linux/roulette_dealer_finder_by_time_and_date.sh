
#!/bin/bash

if [ $1 -eq 1 ]
then
	grep "$2 $3" "$4"_Dealer_schedule | awk '{print $1, $2, $3, $4}'

elif [ $1 -eq 2 ]
then
	grep "$2 $3" "$4"_Dealer_schedule | awk '{print $1, $2, $5, $6}'

elif [ $1 -eq 3 ]
then
	grep "$2 $3" "$4"_Dealer_schedule | awk '{print $1, $2, $7, $8}'

else echo ""
	echo "1=blackjack 2=roulette 3=Texas Hold EM"
	echo "format input example:"
	echo " ./roulette_dealer_finder_by_time_and_game.sh 1 07:00:00 AM 0315"
fi
