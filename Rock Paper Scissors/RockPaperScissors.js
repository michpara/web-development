let rockPaperScissor = Array("rock", "paper", "scissors"); 

//scores
let playerScore = 0;
let computerScore = 0;

//divs
const results = document.querySelector("#results");
const scoreResults = document.querySelector('#score')

//buttons
let rockButton = document.querySelector("#rockButton");
rockButton.addEventListener('click', rockPlay);

let paperButton = document.querySelector("#paperButton");
paperButton.addEventListener('click', paperPlay);

let scissorsButton = document.querySelector("#scissorsButton");
scissorsButton.addEventListener('click', scissorsPlay);

let restartButton = document.querySelector("#restartButton");
restartButton.addEventListener('click', restart);

//paragraph for score
let score = document.createElement('p');

//playerSelection is now rock and a round is played
function rockPlay(){
	playerSelection = "rock";
	singleRound()
	displayScore();
}

//playerSelection is now paper and a round is played
function paperPlay(){
	playerSelection = "paper";
	singleRound()
	displayScore();
}

//playerSelection is now scissors and a round is played
function scissorsPlay(){
	playerSelection = "scissors"
	singleRound()
	displayScore();
}

//restarts the game
function restart(){

	//remove all results
	while(results.firstChild){
		results.removeChild(results.firstChild);
	}

	//removes the score
	while(scoreResults.firstChild){
		scoreResults.removeChild(scoreResults.firstChild);
	}

	//restarts player and computer score
	computerScore = 0;
	playerScore = 0;

	//enables all buttons
	rockButton.disabled = false;
	paperButton.disabled = false;
	scissorsButton.disabled = false;
}

//displays the score
function displayScore(){
    	score.textContent = `COMPUTER SCORE: ${computerScore} | PLAYER SCORE: ${playerScore}`;
    	scoreResults.appendChild(score);
}

//returns the computers choice (rock, paper or scissor)
function computerPlay(){
	let computerSelection = rockPaperScissor[Math.floor(Math.random()*rockPaperScissor.length)];
	return computerSelection;	
}

//plays a single round
function singleRound(){
	let computerSelection = computerPlay();

	if(playerScore < 5 && computerScore < 5){ 

		if(playerSelection.toLowerCase() == "rock"){
			if(computerSelection == "paper"){
				results.innerHTML += `You lose! ${computerSelection} beats ${playerSelection.toLowerCase()}.`;
				results.innerHTML += "<br />";
				computerScore++;
			}

			if(computerSelection == "scissors"){
				results.innerHTML += `You win! ${playerSelection.toLowerCase()} beats ${computerSelection}.`;
				results.innerHTML += "<br />";
				playerScore++;
			}
		}

		if(playerSelection.toLowerCase() == "paper"){
			if(computerSelection == "scissors"){
				results.innerHTML += `You lose! ${computerSelection} beats ${playerSelection.toLowerCase()}.`;
				results.innerHTML += "<br />";
				computerScore++;			
			}

			if(computerSelection == "rock"){
				results.innerHTML += `You win! ${playerSelection.toLowerCase()} beats ${computerSelection}.`;
				results.innerHTML += "<br />";
				playerScore++;
			}
		}

		if(playerSelection.toLowerCase() == "scissors" ){
			if(computerSelection == "rock"){
				results.innerHTML += `You lose! ${computerSelection} beats ${playerSelection.toLowerCase()}.`;
				results.innerHTML += "<br />";
				computerScore++;
			}

			if(computerSelection == "paper"){
				results.innerHTML += `You win! ${playerSelection.toLowerCase()} beats ${computerSelection}.`;
				results.innerHTML += "<br />";
				playerScore++;
			}
		}
	
		if(playerSelection.toLowerCase() == computerSelection){
			results.innerHTML += `It's a tie! You both chose ${playerSelection.toLowerCase()}.`;
			results.innerHTML += "<br />";
		}
	}
		
	if(computerScore == 5 ){
		results.innerHTML += `The winner is the computer, with a score of ${computerScore}.`;
		results.innerHTML += "<br />"

		//disables all buttons
		rockButton.disabled = true;
		paperButton.disabled = true;
		scissorsButton.disabled = true;
	}
	
	if(playerScore == 5){
	    	results.innerHTML += `The winner is you, with a score of ${playerScore}.`;
	    	results.innerHTML += "<br />"

	    	//disables all buttons
	    	rockButton.disabled = true;
	    	paperButton.disabled = true;
	    	scissorsButton.disabled = true;
	}
}
