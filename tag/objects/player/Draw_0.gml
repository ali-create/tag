skew_x = skew_amount
var w = sprite_get_width(sprite_index) * smoothXSquash;
var h = sprite_get_height(sprite_index) * smoothYSquash;
var ox = sprite_get_xoffset(sprite_index) * smoothXSquash;
var oy = sprite_get_yoffset(sprite_index) * smoothYSquash;

// Calculate corners with skew applied to the top edge
var x1 = x - ox + skew_x;          // Top-Left X (offset by skew)
var y1 = y - oy;                   // Top-Left Y
var x2 = x - ox + w + skew_x;      // Top-Right X (offset by skew)
var y2 = y - oy;                   // Top-Right Y
var x3 = x - ox + w;               // Bottom-Right X (no skew)
var y3 = y - oy + h;               // Bottom-Right Y
var x4 = x - ox;                   // Bottom-Left X (no skew)
var y4 = y - oy + h;               // Bottom-Left Y

if(!isInPortal)	draw_sprite_pos(sprite_index, image_index, x1, y1, x2, y2, x3, y3, x4, y4, 1);
else {draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
	)}

if (isIFrame and !isInPortal) 
	{
		draw_sprite_ext(shield,0,x,y,1.2,1.2,0,c_white,0.7)
	} 
	
if (tile.image_alpha == 1) draw_sprite(playerHitbox,0,x,y)