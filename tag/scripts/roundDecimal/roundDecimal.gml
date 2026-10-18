function roundDecimal(num, decimal){
	return floor(num*power(10,decimal))/power(10, decimal)
}