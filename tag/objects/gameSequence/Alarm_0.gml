switch (currentEvent)
			{
					case 0:
						alarm[0] += countdownTime * game_get_speed(gamespeed_fps)
					break;
					case 1:
						if(timeSetting == undefined) alarm[0] += timeSettings[defaultTime] * game_get_speed(gamespeed_fps)
						else alarm[0] += timeSettings[timeSetting] * game_get_speed(gamespeed_fps)
						playerManager.setControl(true)
					break;
					case 2:
						
						switch (global.GamemodeIndex) {
						case 0: {
							for (i = 0; i < playerManager.playerCount; i++)	
								{
									if (playerManager.taggedPlayer[i] == 1)
										{
											playerLostText = "Loser"
											array_push(playerLost, i)
											array_push(playerLostObjects, playerManager.taggedPlayerObject[i])
										}
								}
						}
						break;
						case 1:
							{
								for (i = 0; i < playerManager.playerCount; i++)	
								{
									if (playerManager.taggedPlayer[i] == 0)
										{
											playerLostText = "Winner"
											array_push(playerLost, i)
											array_push(playerLostObjects, playerManager.players[i])
										}
								}
							} 
						break;
						case 2:
							{
								highestScore = 0
								winnerPlayer = 0
								array_foreach(playerManager.players, function (element, index) {
									if (element.distancePoints > highestScore) 
										{
											winnerPlayer = element
											highestScore = element.distancePoints
										}
								})
								
								array_push(playerLost, winnerPlayer.playerNum)
								array_push(playerLostObjects, winnerPlayer)
								playerLostText = "Winner: " + string(highestScore)

							} 
						break;
						}
						playerManager.setControl(false)
						array_foreach(playerLostObjects,function(object, index){
							spawnEffect(object.x,object.y,tagEffectSprite,1,5,true,0,3000)
						})
						timer.announceLoserUI(playerLost, playerLostObjects, playerLostText)
					break;
			}
currentEvent = currentEvent + 1