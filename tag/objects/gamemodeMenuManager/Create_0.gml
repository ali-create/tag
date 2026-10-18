global.GamemodeIndex = 0
global.SecretQuickFall = 0
global.SecretClassicMovement = 1
global.SecretDoubleJump = 0

_panel = new UIPanel("Gamemode", 0, 0, 380, 450, stoneMenu380x450, UI_RELATIVE_TO.MIDDLE_CENTER);
_panel.setTitle("Gamemode").setMovable(false).setResizable(false).setDragBarHeight(0);

// gamemode selection
gamemode = new UIOptionGroup("Gamemodes", 0, -70,  ["[scale, 0.8]Classic","[scale, 0.8]Manhunt","[scale, 0.8]Points"], checkBox,, UI_RELATIVE_TO.MIDDLE_CENTER)
gamemode.setSpriteSelected(checkBoxFilled).setImageMouseover(1).setSpriteMouseover(checkBoxDown)
gamemode.setVertical(true);
_panel.add(gamemode);

gamemode.setIndex(0)

// secrets panel
secretPanelVisible = false
secretPanel = new UIPanel("Secrets", 550, 250, 380, 450, stoneMenu380x450, UI_RELATIVE_TO.MIDDLE_CENTER);
secretPanel.setTitle("secrets").setMovable(false).setResizable(false).setDragBarHeight(0);
secretPanel.setVisible(secretPanelVisible)

quickFallCheckBox = new UICheckbox("QuickFallCheckBox", 30, 50, "quick fall", checkBoxFilled, checkBox, global.SecretQuickFall);
secretPanel.add(quickFallCheckBox);

classicMovementCheckBox = new UICheckbox("ClassicMovementCheckBox", 30, 120, "[scale, 0.6]classic movement", checkBoxFilled, checkBox, global.SecretClassicMovement);
secretPanel.add(classicMovementCheckBox);

doubleJumpCheckbox = new UICheckbox("DoubleJumpCheckBox", 30, 190, "[scale, 0.6]double jump", checkBoxFilled, checkBox, global.SecretDoubleJump);
secretPanel.add(doubleJumpCheckbox);

// play button
_button = new UIButton("PlayButton", 0, 120, 250, 80, "[scale, 0.6]Continue", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButton250x80Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	global.GamemodeIndex = gamemode.getIndex()
	global.SecretQuickFall = quickFallCheckBox.getValue()
	global.SecretClassicMovement = classicMovementCheckBox.getValue()
	global.SecretDoubleJump = doubleJumpCheckbox.getValue()
	transistionManager.goToRoomTransistionObject(mapSelectionMenu,function()
		{
			gamemodePreviewText.textPreviewPanel.destroy()
			gamemodeMenuManager.secretPanel.destroy()
			gamemodeMenuManager._panel.destroy()
		},transistionManager.transitionTime)
});
gamemode.setCallback(UI_EVENT.LEFT_CLICK, function() {
	with(gamemodePreviewText) 
		{
			switch(other.gamemode.getIndex()) 
				{
					case 0:
						text = gamemodeClassic
					break;
					case 1:
						text = gamemodeManhunt
					break;
					case 2:
						text = gamemodePoints
					break;
				}
			text = "[scale,0.4]" + text
			textPreview.setText(text).setTextMouseover(text).setTextClick(text)
		}
	show_debug_message(gamemodePreviewText.text)
});

_panel.add(_button);

// back button
_button = new UIButton("Back", -150, -180, 50, 50, "", stoneButtonX50x50, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButtonX50x50Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	transistionManager.goToRoomTransistionObject(gameOptionsMenu,function()
		{
			gamemodePreviewText.textPreviewPanel.destroy()
			gamemodeMenuManager._panel.destroy()
			gamemodeMenuManager.secretPanel.destroy()
		},transistionManager.transitionTime)
});
_panel.add(_button);

