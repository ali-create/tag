point = 1-(deathTime - current_time) / effectLiftime // point in lifetime
effectScale = mapValue(point,0,1,effectScaleStart,effectScaleEnd)

image_xscale = effectScale
image_yscale = effectScale
image_angle = rotate * point
if (effectFadeOut) image_alpha = 1-point

if(current_time > deathTime) instance_destroy()