#!/bin/bash
echo "---------------------------------------WELLCOME TO SNAKE AND LADDER SIMULATOR------------------------------------------------"
declare -a snakeAndLadderArray
for (( i=1; i<=100; i++ ))
do
   snakeAndLadderArray[i]=0;
done
player1Position=0
player2Position=0
counterForDiceTossed=0
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
function getplayerPosition()
{
  local player_position=$(($2+$1))
   if [ $player_position -gt 100 ]
   then
     local player_position=$(($player_position-$1))
   fi
   echo $player_position
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

   echo "Player position is:" $2

}
while [ $player1Position -ne 100 ]
do
   value=$( rollDie )
   echo "value of dice :" $value
   player1Position=$(getplayerPosition $value $player1Position )
   tempPlayer1Position=$player1Position
   player1Position=$( snakeOrLadderOrNoPlay $tempPlayer1Position )
   gameStatusDisplay $tempPlayer1Position $player1Position
   read -s -n 1 key
      ((counterForDiceTossed++))
   if [ $player1Position -eq 100 ]
   then
      echo "YOU WIN"
   fi
done
echo "Number of times Dice was tossed is:" $counterForDiceTossed

