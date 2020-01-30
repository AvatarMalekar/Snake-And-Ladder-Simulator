#!/bin/bash
echo "---------------------------------------WELLCOME TO SNAKE AND LADDER SIMULATOR------------------------------------------------"

#CONSTANT
PLAYER1=0
PLAYER2=1

#VARIABLES
playingTurn=$PLAYER1
player1Position=0
player2Position=0
player1CounterForDiceTossed=0
player2CounterForDiceTossed=0
declare -a snakeAndLadderArray

for (( i=1; i<=100; i++ ))
do
   snakeAndLadderArray[i]=0;
done
#LADDERS
snakeAndLadderArray[1]=38;
snakeAndLadderArray[4]=14;
snakeAndLadderArray[9]=31;
snakeAndLadderArray[21]=42;
snakeAndLadderArray[28]=84;
snakeAndLadderArray[36]=44;
snakeAndLadderArray[51]=67;
snakeAndLadderArray[71]=91;
snakeAndLadderArray[80]=99;

#SNAKES
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

#FUNCTIONS
function rollDie(){
	echo $((RANDOM%6+1))
}

function snakeOrLadderOrNoPlay(){
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
function getplayerPosition(){
 	local currentPlayerPosition=$(($2+$1))
   if [ $currentPlayerPosition -gt 100 ]
   then
		local currentPlayerPosition=$(($currentPlayerPosition-$1))
   fi
   echo $currentPlayerPosition
}
function gameStatusDisplay()
{
	if [ $1 -lt $2 ]
	then
   	echo "CONGRATS..!! YOU GOT LADDER.."
   elif [ $1 -gt $2 ]
   then
      echo "OOPS..!! YOU GOT SNAKE.."
   else
      echo "YOU ARE ON NO PLAY.."
   fi
	echo  $3 "position is:" $2
}
function playerOne()
{
   counterForSixP1=0
	echo "***********************************************-:Its Player1 turn:-*********************************************************"
	echo "press enter to toss a die"
	read -s -n 1 key
	value=$( rollDie )
   echo "value of dice :" $value
   player1Position=$(getplayerPosition $value $player1Position )
   tempPlayer1Position=$player1Position
   player1Position=$( snakeOrLadderOrNoPlay $tempPlayer1Position )
	gameStatusDisplay $tempPlayer1Position $player1Position $"Player1"
   ((player1CounterForDiceTossed++))
   if [ $player1Position -eq 100 ]
   then
   	echo "PYAVER1 WIN"
   fi
   if [ $value -eq 6 -a $counterForSixP1 -lt 2 ]
   then
		playingTurn=$PLAYER1
      ((counterForSixP1++))
   else
      playingTurn=$PLAYER2
   fi
}

function playerTwo(){
   counterForSixP2=0
   echo "*************************************************-:Its Player2 turn:-********************************************************"
   echo "press enter to toss a die"
   read -s -n 1 key
   value=$( rollDie )
   echo "value of dice :" $value
   player2Position=$(getplayerPosition $value $player2Position )
   tempPlayer2Position=$player2Position
	player2Position=$( snakeOrLadderOrNoPlay $tempPlayer2Position )
   gameStatusDisplay $tempPlayer2Position $player2Position $"Player2"
   ((player2CounterForDiceTossed++))
   if [ $player2Position -eq 100 ]
   then
 		echo "PLAYER2 WIN"
   fi
   if [ $value -eq 6 -a $counterForSixP2 -lt 2 ]
   then
   	playingTurn=$PLAYER2
      ((counterForSixP2++))
   else
      playingTurn=$PLAYER1
   fi
}

#MAIN
while [ $player1Position -ne 100 -a $player2Position -ne 100 ]
do
   if [ $playingTurn -eq $PLAYER1 ]
   then
   	playerOne
   else
   	playerTwo
fi
done
echo "Number of times Dice tossed by player1 is :" $player1CounterForDiceTossed
echo "Number of times Dice tossed by player2 is :" $player2CounterForDiceTossed

