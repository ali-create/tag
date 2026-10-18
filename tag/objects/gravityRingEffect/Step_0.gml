scale = (deathTime - current_time) / lifetime
rotation = (deathTime - current_time) * rotateSpeed

image_angle = rotation
image_xscale = scale * effectScale
image_yscale = scale * effectScale

if(current_time > deathTime) instance_destroy()