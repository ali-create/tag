nearestPlayer = instance_nearest(x,y,player)
distToPlayer = point_distance(x,y,nearestPlayer.x,nearestPlayer.y)

if (distToPlayer<distanceThreshold)
	{
		scale = clamp((1-distToPlayer/distanceThreshold)*effectRamping,1,effectScale)
		image_xscale = scale
		image_yscale = scale
	}
	else
	{
		image_xscale = 1
		image_yscale = 1		
	}
