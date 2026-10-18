function spawnEffect(_x,_y, sprite, scaleStart=1, scaleEnd=0, fadeOut=false, rotationOverLifetime = 0, lifetime = 1000) 
	{
		effect = instance_create_layer(_x,_y,"Effects", baseEffect)
		with(effect)
			{
				x = _x
				y = _y
				sprite_index = sprite
				image_xscale = scaleStart
				image_yscale = scaleStart
				effectFadeOut = fadeOut
				effectLiftime = lifetime
				
				rotate = rotationOverLifetime
				deathTime = current_time + effectLiftime
				effectScaleStart = scaleStart
				effectScaleEnd = scaleEnd
			}
	}