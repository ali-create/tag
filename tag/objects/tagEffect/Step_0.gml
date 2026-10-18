scale = (deathTime - current_time) / lifetime
scale = -sqrt(-scale+1)+1

visible = true
image_xscale = scale * effectScale
image_yscale = scale * effectScale

if(current_time > deathTime) instance_destroy()