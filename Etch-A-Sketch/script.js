
//initial variables
let container = document.getElementById("container");
let clear = document.getElementById("clear");
let color = document.getElementById("color");
let size = document.getElementById("size");
let divs = document.getElementsByClassName("div");

//clears the grid when the Clear Grid button is clicked
clear.addEventListener("click", gridClear);

//changes the size of the grid when the button Change Size is clicked
size.addEventListener("click", changeSize);

//not done
color.addEventListener("click", workInProgress);

//creates grid and allows it to be colored in.
function createGrid(gridSize, currentColor){
	let powGridSize = Math.pow(gridSize, 2);
	for(let i = 0; i < powGridSize; i++){

		let gridDiv = document.createElement("div");

		gridDiv.classList.add("div");
		container.appendChild(gridDiv);

		gridDiv.style.width = 400/gridSize;
		gridDiv.style.height = 400/gridSize;
	}

	for(let i = 0; i < divs.length; i++){
		divs[i].addEventListener("mouseover", function(){
			divs[i].style.background = currentColor;
		})
	}
}

//function to clear the entire grid when the button "clear" is clicked
function gridClear(){
	for(let i = 0; i<divs.length; i++){
		divs[i].style.background = "";
	}
}

//removes the grid from the screen
function removeGrid(){
	while(container.firstChild){
		container.removeChild(container.firstChild);
	}
}

//changes the size of the grid
function changeSize(){
	gridSize = prompt("How many grids do you want per side?");
	removeGrid();
	createGrid(gridSize, "black");
}

//generates random colors for the grid
function random_rgba() {
    var o = Math.round, r = Math.random, s = 255;
    return 'rgba(' + o(r()*s) + ',' + o(r()*s) + ',' + o(r()*s) + ',' + r().toFixed(1) + ')';
}