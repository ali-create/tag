for (i = 0; i < array_length(players); i++)
	{
		selectedPlayer = players[i]
		if (taggedPlayer[selectedPlayer.playerNum] == 1)
			{
				taggedPlayerObject[i] = selectedPlayer
				selectedPlayer.isTagged = true
				
			}
		else 
			{
				taggedPlayerObject[i] = 0
			}
	}
	
if (global.GamemodeIndex == 1 and taggedPlayersCount == playerCount-1) 
	{
		taggedPlayer[lastTaggedPlayerObject.playerNum] = 0
		taggedPlayersCount--
		setTagging(false)
		gameSequence.alarm[0] = 2
	}