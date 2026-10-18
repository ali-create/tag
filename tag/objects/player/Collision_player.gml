// tagging other
if  (
		playerManager.taggedPlayer[playerNum] == 1 and 
		playerManager.taggedPlayer[other.playerNum] == 0 and
		current_time > playerManager.tagCooldownTime and
		!isInPortal and allowTagging and !other.isIFrame
	) 
	{
		other.distancePoints -= 2.5 // getting tagged
		distancePoints += 3 // tagging others
		
		playerManager.taggedPlayer[other.playerNum] = 1
		playerManager.lastTaggedPlayerObject = other
		alarm[1] += iFramesOnTag
		
		
		switch (global.GamemodeIndex) 
			{
				case 0:
					playerManager.taggedPlayer[playerNum] = 0
				break;
				case 1:
					playerManager.taggedPlayer[playerNum] = 1
				break;
				case 2:
					playerManager.taggedPlayer[playerNum] = 0
				break;
			}
		if (global.GamemodeIndex == 1) playerManager.taggedPlayersCount++
		playerManager.tagCooldownTime = current_time + playerManager.tagCooldown
		
		centerX = (x+other.x)/2
		centerY = (y+other.y)/2
		effect = instance_create_layer(centerX,centerY, "Effects",tagEffect)
	}


