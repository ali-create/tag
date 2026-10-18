gamePaused = gamePaused ? 0 : 1


if (gamePaused)
	{
		instance_deactivate_all(true)
		instance_activate_object(UI)
		_panel = new UIPanel("GamePaused", 0, 0, 380, 450, stoneMenu380x450, UI_RELATIVE_TO.MIDDLE_CENTER);
		_panel.setTitle("").setMovable(false).setResizable(false);
		titleText = new UIText("TitleText", 0, -200, "Game Paused", UI_RELATIVE_TO.MIDDLE_CENTER)
		_panel.add(titleText)

		_button = new UIButton("[scale, 0.7]QuitToMenuButton", 0, 90, 250, 80, "Quit to menu", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
		_button.setSpriteMouseover(stoneButton250x80Down)
		
		_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
			instance_activate_object(timer)
			timer.timerPanel.destroy()
			room_goto(startMenu)		
			_panel.destroy()
			if (global.GamemodeIndex==2) ui_get("PointsPanel").destroy()
			if (timer.gameOver) ui_get("LoserPanel").destroy()
			if (ui_exists("TipsMenu")) ui_get("TipsMenu").destroy()
			
			
		});
		_panel.add(_button)

		_button = new UIButton("ResumeButton", 0, 180, 250, 80, "Resume", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
		_button.setSpriteMouseover(stoneButton250x80Down)
		_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
			gamePaused = 0
			instance_activate_all()	
			_panel.destroy()
	});
		_panel.add(_button)
		
		
_button = new UIButton("Freeze", 0, 330, 250, 80, "freeze", green_button00, UI_RELATIVE_TO.MIDDLE_CENTER);
		_button.setSpriteMouseover(green_button01)
		_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
			freezeMovementToggle = freezeMovementToggle ? 0 : 1
			instance_activate_object(playerManager)
			playerManager.freezeControls(freezeMovementToggle)
	});
		// _panel.add(_button)
	}
else
	{
		instance_activate_all()	
		_panel.destroy()
	}
	