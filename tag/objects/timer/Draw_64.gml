if (gameSequence.alarm[0]>0 and drawTimer)
{
	timeLeft =  gameSequence.alarm[0]
	drawText = roundDecimal(timeLeft/game_get_speed(gamespeed_fps), 0)
	if (drawText < 15 and gameSequence.currentEvent == 2) timerRed = sin(current_time/200) * 255 else timerRed = 255
	textColor = rgb_to_hex(255,timerRed,timerRed)
	drawText = "[" + textColor + "]" + string(drawText)
	
	timerText.setText(drawText).setTextMouseover(drawText).setTextClick(drawText)
	
}