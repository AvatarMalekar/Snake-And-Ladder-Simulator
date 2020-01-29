#!/bin/bash
echo "---------------------------------------WELLCOME TO SNAKE AND LADDER SIMULATOR------------------------------------------------"
declare -a snakeAndLadderArray
for (( i=1; i<=100; i++ ))
do
   snakeAndLadderArray[i]=0;
done
playerPosition=0
var=0
snakeAndLadderArray[1]=38;
snakeAndLadderArray[4]=14;
snakeAndLadderArray[9]=31;
snakeAndLadderArray[21]=42;
snakeAndLadderArray[28]=84;
snakeAndLadderArray[36]=44;
snakeAndLadderArray[51]=67;
snakeAndLadderArray[71]=91;
snakeAndLadderArray[80]=99;
snakeAndLadderArray[16]=6;
snakeAndLadderArray[49]=11;
snakeAndLadderArray[62]=19;
snakeAndLadderArray[87]=24;
snakeAndLadderArray[95]=75;
snakeAndLadderArray[47]=26;
snakeAndLadderArray[56]=53;
snakeAndLadderArray[64]=60;
snakeAndLadderArray[93]=73;
snakeAndLadderArray[98]=78;
function rollDie(){
   echo $((RANDOM%6+1))
}

function snakeOrLadderOrNoPlay()
{
	for (( i=1; i<=100; i++ ))
	do
		if [ $i -eq $1 ]
		then
			var=${snakeAndLadderArray[$i]}
			break;
		elif [ $i -ne $1 -a $i -gt 99 ]
		then
			var=$1
		else
			true
		fi
	done
	if [ $var -eq 0 ]
	then
		echo $1
	else
		echo $var
	fi
}


while [ $playerPosition -ne 100 ]
do
	value=$( rollDie )
	echo "value of dice :" $value
	playerPosition=$(($playerPosition+$value))
	if [ $playerPosition -gt 100 ]
	then
		playerPosition=$(($playerPosition-$value))
	fi

	tempPlayerPosition=$playerPosition
	playerPosition=$( snakeOrLadderOrNoPlay $playerPosition )

	if [ $tempPlayerPosition -lt $playerPosition ]
	then
		echo "CONGRATS..!! YOU GOT LADDER.."
	elif [ $tempPlayerPosition -gt $playerPosition ]
	then
		echo "OOPS..!! YOU GOT SNAKE.."
	else
		echo "YOU ARE ON NO PLAY.."
	fi

	echo position is $playerPosition
	read -s -n 1 key

	if [ $playerPosition -eq 100 ]
   then
      echo "YOU WIN"
   fi
done


