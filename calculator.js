function add(a, b){
	return a + b;
}

function subtract(a, b){
	return a - b;
}

function multiply(a, b){
	return a * b;
}

function divide(a, b){
	return a / b;
}

function operate(operator, a, b){
	if(operator == '+'){
		add(a, b)
	}
	if(operator == '-'){
		subtract(a, b)
	}
	if(operator == 'x'){
		multiply(a, b)
	}
	if(operator == '/'){
		divide(a, b)
	}
}

function display(button){

    button.addEventListener('click', function() {
        document.getElementById('textarea').value += this.value;
    });
}

var buttons = document.getElementsByClassName('button');
var operation = '';
var operators = ['+', '-', 'x', '/']
var numbers = []

for(var i = 0; i < buttons.length; i++){
	buttons[i].addEventListener('click', display(buttons[i]));
	(function(i){
		document.getElementById(buttons[i].id).onclick = function(){
			numbers.push(buttons[i].value)
		}
	})(i)
}

document.getElementById('=').onclick = function(){
	document.getElementById('textarea').value += numbers[0] + numbers[1];

}

document.getElementById('CE').onclick = function(){
	document.getElementById('textarea').value = ''
}




