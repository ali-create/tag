function mapValue(_value,_from_low, _from_high, _to_low,_to_high){
	return (( _value - _from_low ) / ( _from_high - _from_low )) * ( _to_high - _to_low ) + _to_low;   
}