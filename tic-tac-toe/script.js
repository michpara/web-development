const GameBoard = (() => {
	const size = 3;
	let gameboard = [["", "", ""], ["", "", ""], ["", "", ""]];

	const getGameBoard = () => gameboard;

	const displayGameBoard = () => {
		let rows = gameboard.length;
		let cols = gameboard[0].length;
		let gameboardDiv = document.querySelector("#gameboard");
		for(var row = 0; row < rows; row++){
			for(var col = 0; col < cols; col++){
				var cell = document.createElement("div");
				if(gameboard[row][col] === ""){
					cell.innerHTML = gameboard[row][col];
				} else {
					cell.appendChild(gameboard[row][col])
				}
				cell.id = [row, col];
				cell.setAttribute("class", "cell");
				gameboardDiv.appendChild(cell);

				cell.style.top = row * 110 + "px";
				cell.style.left = col * 110 + "px";
			}
		}
	};

	const play = (player, row, col) => {
		symbol = player.getSymbol();
		gameboard[row][col] = symbol;
		displayGameBoard();
		if(GameBoard.gameOver(symbol, row, col) == 0){
			document.getElementById("winner").innerHTML = ("The game is over! " + player.getName() + " is the winner!");
		} else if (GameBoard.gameOver(symbol, row, col) == 1){
			document.getElementById("winner").innerHTML = ("It is a draw!")
		} else {
			Game.listen();
			Game.increaseMoveCount();
		}
	};

	const gameOver = (symbol, row, col) => {
		for(var i = 0; i<size; i++){
			if(gameboard[row][i].alt != symbol.alt){
				break;
			}
			if(i == size-1){
            	return 0;
            }
		}

		for(var i = 0; i<size; i++){
			if(gameboard[i][col].alt != symbol.alt){
				break;
			}
			if(i == size-1){
            	return 0;
            }
		}

		if(row == col){
			for(var i = 0; i<size; i++){
				if(gameboard[i][i].alt != symbol.alt){
					break;
				}
				if(i == size-1){
           		 	return 0;
            	}
			}
		}
		if(row + col == size-1){
			for(var i = 0; i<size; i++){
				if(gameboard[i][size-1-i].alt != symbol.alt){
					break;
				}
				if(i == size-1){
            		return 0;
           		}
			}
		}
		if(Game.getMoveCount() >= (size*size-1)){
			return 1
		}
	}

	const clearBoard = () => {
		gameboard = [["", "", ""], ["", "", ""], ["", "", ""]];
	}

	return {getGameBoard, displayGameBoard, play, gameOver, clearBoard};
})();

const Player = (symbol, name) => {
  const getSymbol = () => symbol;
  const getName = () => name;
  return {getSymbol, getName};
};

const Game = (() => {

	let turn = false;

	let moveCount = 0;

	GameBoard.displayGameBoard();

	const getMoveCount = () => {
		return moveCount;
	};

	const increaseMoveCount = () => {
		moveCount++;
	};

	const listen = () => {
		player1Name = document.getElementById("player1").value;
		player2Name = document.getElementById("player2").value;

		symbolX = document.createElement("img");
		symbolX.src="images/tic-tac-toe-x.png"
		symbolX.width = 100;
		symbolX.alt = "x"

		symbolO = document.createElement("img");
		symbolO.src="images/tic-tac-toe-o.png"
		symbolO.width = 90;
		symbolO.alt = "o"


		const player1 = Player(symbolX, player1Name);
		const player2 = Player(symbolO, player2Name);
		
		const cells = document.getElementsByClassName("cell");
			if(turn){
				player = player2;
				turn = false;
			} else {
				player = player1;
				turn = true;
			}
		Array.from(cells).forEach((cell) => {
			cell.addEventListener("click", function(){
				if(GameBoard.getGameBoard()[cell.id[0]][cell.id[2]] === ""){
					GameBoard.play(player, parseInt(cell.id[0]), parseInt(cell.id[2]))
				}
			})
		});
	};

	const reset = () => {
		window.location.reload();
	}
	return {listen, moveCount, getMoveCount, increaseMoveCount, reset};
})();

document.getElementById("start").addEventListener("click", function(){
	player1Name = document.getElementById("player1").value;
	player2Name = document.getElementById("player2").value;

	if(player1Name === '' || player2Name === ''){
		alert("Please input your names!");
	} else {
		Game.listen();
	}
})

document.getElementById("reset").addEventListener("click", function(){
	Game.reset();
})