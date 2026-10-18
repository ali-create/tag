playerObject = playerManager.taggedPlayerObject[playerFollowing]

if(playerObject)
	{
		visible = true
		targetX = playerObject.x
		targetY = playerObject.y
		offsetX = playerObject.sprite_width / 2
		offsetY = playerObject.sprite_height - 150 + (sin(current_time/400)*15)/(1+(abs(playerObject.horizontalVelocity+playerObject.verticalVelocity)*2))
		scaleOffset = playerObject.image_yscale * (playerObject.sprite_height/2) - playerObject.sprite_height/2

		x = targetX
		y = targetY + offsetY - scaleOffset
	}
	else
	{
		visible = false
	}