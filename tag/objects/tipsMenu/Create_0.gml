function showTip(text = "helo") 
	{
		_panel = new UIPanel("TipsMenu", 450, -280, 400, 200, stoneMenu400x200, UI_RELATIVE_TO.MIDDLE_CENTER);
		_panel.setTitle("Tip").setMovable(false).setResizable(false).setDragBarHeight(0);
		
		_text = new UIText("TipsText", 0, 0, "[scale,0.7]"+text, UI_RELATIVE_TO.MIDDLE_CENTER)
		_text.setMaxWidth(350)
		_panel.add(_text)
		_text = new UIText("TipsText", 0, 60, "[scale,0.3]Press tab to close", UI_RELATIVE_TO.MIDDLE_CENTER)
		_text.setMaxWidth(350)
		_panel.add(_text)
		alarm[0] = 15 * game_get_speed(gamespeed_fps)
	}