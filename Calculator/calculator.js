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
		a =  add(a, b)
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

function displayAnswer(answer){
	document.getElementById('textarea').value = answer
}


var buttons = document.getElementsByClassName('button');
var operation = '';
var numbers = [];
var operators = ['+', '-', 'x', '/']

for( var i = 0; i < buttons.length; i++){
	buttons[i].addEventListener('click', display(buttons[i]));
	if(operators.includes(buttons[i].value)){
		operation = buttons[i].value;
	}else{
		numbers.push(buttons[i].value)
	}
}


