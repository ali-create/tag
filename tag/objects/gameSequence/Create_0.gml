// 3 sec countdown, game playing time, endscreen
countdownTime = 4
startTime = current_time + countdownTime
timeUntilNextEvent = 0 // time until game start, game end, etc
nextEventTime = 0
freezeTime = false
freezeStartTime = 0
freezeTimer = 0
timerOffset = 0
sequenceTimer = 0
gameStartTime = 0
currentEvent = 0
alarm[0] = 1
freezeMovementToggle = 0
game_set_speed(60,gamespeed_fps)

gamePaused = false

startedCountdown = false
startedGame=false
startedEndscreen=false
runSequence = true

timeSetting = global.TimeAmountIndex
timeSettings = [60, 120, 180, 240]
defaultTime = 1
completeInit = false
playerLost = []
playerLostObjects = []
playerLostText = "sasa"

function freezeTimeFunc(state) 
	{
		if (state == true)
			{
				freezeTime = true
				freezeStartTime = current_time
			}
		else
			{
				freezeTime = false
			}
	}