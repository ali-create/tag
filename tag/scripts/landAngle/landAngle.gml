function getSurfaceAngle(){
	/// @func get_surface_angle(other, contact_x, contact_y)
	/// @desc Returns the world-space surface angle at the contact point.
	/// Works for both rotated rectangles and ellipses.
var _other = argument0;
var _cx = argument1;
var _cy = argument2;

var _dx = _cx - _other.x;
var _dy = _cy - _other.y;
var _c = dcos(_other.image_angle);
var _s = dsin(_other.image_angle);

// Transform contact point into local space
var _lx = _dx * _c + _dy * _s;
var _ly = -_dx * _s + _dy * _c;

var _hw = sprite_get_width(_other.sprite_index) / 2;
var _hh = sprite_get_height(_other.sprite_index) / 2;

// --- RECTANGLE ---
// Normal is always along a local axis, so just pick the closer face
if (abs(_lx) / _hw > abs(_ly) / _hh) {
    // Hit left or right face
    var _normal_local = (_lx > 0) ? 90 : 270;
} else {
    // Hit top or bottom face
    var _normal_local = (_ly > 0) ? 0 : 180;
}

// --- ELLIPSE (uncomment if needed) ---
// var _a = _hw;
// var _b = _hh;
// var _normal_local = point_direction(0, 0, _lx / (_a * _a), _ly / (_b * _b));

// Rotate normal back to world space
return _normal_local + _other.image_angle;
}