function rgb_to_hex(_r, _g, _b) {
    _hex_chars = "0123456789ABCDEF";
    var _result = "#";
    
    // Helper: convert a single 0-255 value to 2 hex digits
    var _to_hex_byte = function(_val) {
        return string_char_at(_hex_chars, (_val div 16) + 1)
             + string_char_at(_hex_chars, (_val mod 16) + 1);
    };
    
    _result += _to_hex_byte(_r);
    _result += _to_hex_byte(_g);
    _result += _to_hex_byte(_b);
    
    return _result;
}