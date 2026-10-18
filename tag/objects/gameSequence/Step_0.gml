// game sequence
/*if (runSequence){
	if (!gamePaused) {
		sequenceTimer = current_time
		if (startedCountdown==false)
			{	
				gameStartTime = sequenceTimer
				nextEventTime = sequenceTimer + countdownTime
				startedCountdown = true
			}
		if (sequenceTimer > nextEventTime and startedGame == false)
			{
				startedGame = true
				playerManager.setControl(true)
				if(timeSetting == undefined) nextEventTime = sequenceTimer + timeSettings[defaultTime] * 1000
				else nextEventTime = sequenceTimer + timeSettings[timeSetting] * 1000
			}
		if (startedGame and sequenceTimer > nextEventTime)
			{
				playerLost = playerManager.taggedPlayer
				playerManager.setControl(false)
				timer.announceLoserUI(playerLost)
				runSequence = false
			}
		}
	else 
		{
			nextEventTime += 1
		}
}
*/

if(gamePaused) 
	{
		gameSequence.alarm[0] += 1
	}
