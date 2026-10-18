followers = []
for (i = 0; i < playerManager.playerCount; i++)	
	{
		followers[i] = instance_create_layer(0,0,"TaggedPlayerFollower", taggedFollower)	
		show_debug_message(i)
		with (followers[i])
			{
				playerFollowing = other.i
			}
	}