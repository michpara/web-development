let rockPaperScissor = Array("rock", "paper", "scissors"); 

//returns the computers choice (rock, paper or scissor)
function computerPlay(){
	let computerSelection = rockPaperScissor[Math.floor(Math.random()*rockPaperScissor.length)];
	return computerSelection;	
}

//function for the round
function singleRound(){
	let computerSelection = computerPlay();
	let playerSelection = prompt("Please choose 'rock', 'paper' or 'scissors'");
	if(playerSelection.toLowerCase() == "rock"){
		if(computerSelection == "paper"){
			console.log(`You Lose! ${computerSelection} beats ${playerSelection.toLowerCase()}.`);
			return -1;
		}
		if(computerSelection == "scissors"){
			console.log(`You Win! ${playerSelection.toLowerCase()} beats ${computerSelection}.`);
			return 1;
		}

	}
	if(playerSelection.toLowerCase() == "paper"){
		if(computerSelection == "scissors"){
			console.log(`You Lose! ${computerSelection} beats ${playerSelection.toLowerCase()}.`);
			return -1;
		}
		if(computerSelection == "rock"){
			console.log(`You Win! ${playerSelection.toLowerCase()} beats ${computerSelection}.`);
			return 1;
		}
	}
	if(playerSelection.toLowerCase() == "scissors"){
		if(computerSelection == "rock"){
			console.log(`You Lose! ${computerSelection} beats ${playerSelection.toLowerCase()}.`);
			return -1;
		
		}
		if(computerSelection == "paper"){
			console.log(`You Win! ${playerSelection.toLowerCase()} beats ${computerSelection}.`);
			return 1;
	
		}
	}
	if(playerSelection.toLowerCase() == computerSelection){
		console.log(`It's a tie! You both chose ${playerSelection.toLowerCase()}.`);
		return 0;
	}
	else{
		return 2;
	}

}

//function for the game
function game(){
	let playerScore = 0;
	let computerScore = 0;
	let numberOfRounds = 0;
	while(numberOfRounds < 5){
		let roundScore = singleRound();
		if(roundScore == -1){
			computerScore++;

		}
		if(roundScore == 1){
			playerScore++;
	
		}
		if(roundScore == 2){
			continue;
		}
	
		numberOfRounds++;
	}
	if(computerScore > playerScore){
		console.log(`The winner is the computer, with a score of ${computerScore}.`);
	}
	if(playerScore > computerScore){
		console.log(`The winner is you, with a score of ${playerScore}.`);
	}
}
