//initial variables
let gridSize = 100;
let container = document.getElementById("container");
let clear = document.getElementById("clear");
let divs = document.getElementsByClassName("div");

clear.addEventListener("click", gridClear);

//generates random colors for the grid
function random_rgba() {
    var o = Math.round, r = Math.random, s = 255;
    return 'rgba(' + o(r()*s) + ',' + o(r()*s) + ',' + o(r()*s) + ',' + r().toFixed(1) + ')';
}

//creates grid and allows it to be colored in.
function createGrid(gridSize){
	for(let i = 0; i < gridSize; i++){

		let gridDiv = document.createElement("div");

		gridDiv.classList.add("div");
		container.appendChild(gridDiv)

		gridDiv.style.width = 400/Math.sqrt(gridSize);
		gridDiv.style.height = 400/Math.sqrt(gridSize);
	}

	for(let i = 0; i < divs.length; i++){
		divs[i].addEventListener("mouseover", function(){
			divs[i].style.background = random_rgba();
		})
	}
}

//removes the grid from the screen
function removeGrid(){
	while(container.firstChild){
		container.removeChild(container.firstChild);
	}
}

//function to clear the entire grid when the button "clear" is clicked
function gridClear(){
	for(let i = 0; i<divs.length; i++){
		divs[i].style.background = "";
	}

	gridSize = prompt("How many squares would you like per side for your new grid?")
	
	if (gridSize === ""){
		gridSize = 100;
	}
	
	removeGrid()
	createGrid(gridSize)
}

//function calls
createGrid(gridSize)
colorGrid()