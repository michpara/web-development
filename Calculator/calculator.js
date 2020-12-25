function add(a, b){
	return parseFloat(a) + parseFloat(b);
}

function subtract(a, b){
	return parseFloat(a) - parseFloat(b);
}

function multiply(a, b){
	return parseFloat(a) * parseFloat(b);
}

function divide(a, b){
	if(b == "0"){
		clear();
		var e = new Error('Can\'t divide by 0!'); 
		throw e;
	}
	return parseFloat(a) / parseFloat(b);
}

function operate(operator, a, b){
	if(operator == '+'){
		return add(a, b);
	}
	if(operator == '-'){
		return subtract(a, b);
	}
	if(operator == 'x'){
		return multiply(a, b);
	}
	if(operator == '/'){
		return divide(a, b);
	}
}

var numbers = []; 

function display(value){
    document.getElementById('textarea').value += value;
    numbers.push(value);
}

var operators = ['+', '-', '/', 'x'];
var result = '';

function calculate(){	
	var leftNum;
	var rightNum; 
	var resultNum;

	var left = [];
	var right = [];
	var operator = '';

	if(result != ''){
		left.push(result);
	}

	for(var i = 0; i<numbers.length; i++){
		//if left hand side add to left array
		if(operator == '' && !operators.includes(numbers[i]) && result == ''){
			left.push(parseInt(numbers[i]));
		}

		//if an operator add to operator variable
		else if(operators.includes(numbers[i]) && operator == ''){
			operator = numbers[i];
		}

		//if right hand side add to right array 
		else if(operator != '' && !operators.includes(numbers[i])){
			right.push(parseInt(numbers[i]));
		}

		else if(operator != '' && operators.includes(numbers[i])) {
			console.log(left + operator + right);
			leftNum = left.join(""); //convert all the left hand side numbers to a single number
			rightNum = right.join(""); //convert all the right hand side numbers to a single number
			resultNum = operate(operator, leftNum, rightNum); //operate on both
			left.length = 0; //empty the left array
			right.length = 0; //empty the right array
			left.push(resultNum); //push the result to the emptied left array
			operator = numbers[i]; //add the next operator to the operator value.
		}
	}

	//make sure we have all data before calculating
	if(left.length == 0 || right.length == 0 || operator == ''){
		clear();
		var e = new Error("Must enter numbers/operators!");
		throw e;
	}

	leftNum = left.join(""); //convert all the left hand side numbers to a single number
	rightNum = right.join(""); //convert all the right hand side numbers to a single number
	resultNum = operate(operator, leftNum, rightNum); //operate on both
	console.log("result: " + resultNum)
	left.length = 0; //empty the left array
	right.length = 0; //empty the right array

	result = round(resultNum, 10);
	numbers.length = 0; //empty numbers array 
	document.getElementById('textarea').value = '';
	display(result);
}

function clear(){
	document.getElementById('textarea').value = '';
	numbers.length = 0;
	result = '';
}

function round(value, decimals) {
  return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
}

document.getElementById("=").addEventListener("click", function(e) {
	calculate();
});
document.getElementById("CE").addEventListener("click", function(e) {
	clear();
});