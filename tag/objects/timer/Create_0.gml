drawTimer = true
gameOver = false

timerPanel = new UIPanel("Timer", -500, -300, 164, 80, timerBack, UI_RELATIVE_TO.MIDDLE_CENTER);
timerPanel.setTitle("").setMovable(false).setResizable(false).setDragBarHeight(0);

timerText = new UIText("TimerText", 0, 0, "time",  UI_RELATIVE_TO.MIDDLE_CENTER)
timerPanel.add(timerText)


announceLoserUI = function(loser, loserObjects, text = "Loser") 
	{
		gameOver = true
		drawTimer = false
		_panel = new UIPanel("LoserPanel", 0, 0, 380, 450, stoneMenu380x450, UI_RELATIVE_TO.MIDDLE_CENTER);
		_panel.setTitle("").setMovable(false).setResizable(false);
		
		titleText = new UIText("TitleText", 0, -100, text, UI_RELATIVE_TO.MIDDLE_CENTER)
		_panel.add(titleText)
		
		for (i = 0; i < array_length(loser); i++) {
			spriteX = (i-(array_length(loser)-1)/2)*100
			winnerSprite = new UISprite("LoserSprite", spriteX, 0, playerDefault, 80, 80, loserObjects[i].playerNum, UI_RELATIVE_TO.MIDDLE_CENTER, time_source_game)
			winnerSprite.setAnimationStep(4)
			_panel.add(winnerSprite)
		}
		
		_button = new UIButton("RestartButton", 0, 90, 250, 80, "Restart", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
		_button.setSpriteMouseover(stoneButton250x80Down)
		
		_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
			room_restart()
			if (global.GamemodeIndex==2) ui_get("PointsPanel").destroy()
			timerPanel.destroy()
			_panel.destroy()
		});
		_panel.add(_button)
		
		
		_button = new UIButton("BackButton", 0, 180, 250, 80, "Back", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
		_button.setSpriteMouseover(stoneButton250x80Down)
		
		_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
			room_goto(startMenu)
			if (global.GamemodeIndex==2) ui_get("PointsPanel").destroy()
			timerPanel.destroy()
			_panel.destroy()
		});
		_panel.add(_button)
	}