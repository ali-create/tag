randomizedSpawns = array_shuffle(portalSpawnPoints)

if(playerInPortal) alarm[0]++

for (i = 0; i < array_length(portals); i++)	
	{
		if (portals[i] and !playerInPortal)	{
				portalInstance = portals[i]
			with (portalInstance)
				{
					spawnEffect(x+sprite_width/2,y+sprite_height/2,portalSpawnEffect,1,3,true,0,1000)
					instance_destroy()
				}
			}
	}	


for (i = 0; i < 2; i++)	
	{
		spawnPoint = layer_instance_get_instance(randomizedSpawns[i])
		portals[i] = instance_create_layer(spawnPoint.x, spawnPoint.y,"Interactables",portal)
		portalInstance = portals[i]
		with (portalInstance)
			{
				portalNum = other.i
				isFlickering = true
				alarm[0] = 3 * game_get_speed(gamespeed_fps)
			}
	}	

alarm[0] = alarm[0] + portalCooldown * game_get_speed(gamespeed_fps)