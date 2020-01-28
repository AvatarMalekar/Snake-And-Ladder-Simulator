#!/bin/bash -x
echo "---------------------------------------WELLCOME TO SNAKE AND LADDER SIMULATOR------------------------------------------------"
SNAKE_AND_LADDER_GAME_BOARD=100;
rollDie(){
	resultOfRollDie=$((RANDOM%6+1))
	echo $resultOfRollDie
}
playerPosition=$( rollDie )
