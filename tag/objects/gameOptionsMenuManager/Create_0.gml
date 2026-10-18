global.TimeAmountIndex = 1
global.PlayerAmount = 2

_panel = new UIPanel("GameOptions", 0, 0, 380, 450, stoneMenu380x450, UI_RELATIVE_TO.MIDDLE_CENTER);
_panel.setTitle("Options").setMovable(false).setResizable(false).setDragBarHeight(0);

text = new UIText("AmountOfPlayersText", 0, -140, "[scale, 0.6]Amount of players",  UI_RELATIVE_TO.MIDDLE_CENTER)
_panel.add(text)

gamePlayers = new UIOptionGroup("GamePlayers", 0, -90,  ["[scale, 0.5]2","[scale, 0.5]3","[scale, 0.5]4"], checkBox,, UI_RELATIVE_TO.MIDDLE_CENTER)
gamePlayers.setSpriteSelected(checkBoxFilled).setImageMouseover(1).setSpriteMouseover(checkBoxDown)
gamePlayers.setVertical(false);
_panel.add(gamePlayers);

text = new UIText("TimeAmountText", 0, 10, "[scale, 0.6]Time amount",  UI_RELATIVE_TO.MIDDLE_CENTER)
_panel.add(text)

timeAmount = new UIOptionGroup("TimeAmount", 0, 60, ["[scale,0.5]60","[scale,0.5]120","[scale,0.5]180","[scale,0.5]240"], checkBox,, UI_RELATIVE_TO.MIDDLE_CENTER)
timeAmount.setSpriteSelected(checkBoxFilled).setImageMouseover(1).setSpriteMouseover(checkBoxDown)
timeAmount.setVertical(false);
_panel.add(timeAmount);

gamePlayers.setIndex(0)
timeAmount.setIndex(1)

_button = new UIButton("Back", -150, -180, 50, 50, "", stoneButtonX50x50, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButtonX50x50Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	transistionManager.goToRoomTransistionObject(startMenu,function()
		{
			gameOptionsMenuManager._panel.destroy()
		},transistionManager.transitionTime)
});
_panel.add(_button);

_button = new UIButton("PlayButton", 0, 120, 250, 80, "[scale, 0.6]Continue", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButton250x80Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	global.TimeAmountIndex = timeAmount.getIndex()
	global.PlayerAmount = gamePlayers.getIndex() + 2
	transistionManager.goToRoomTransistionObject(gamemodeMenu,function()
		{
			gameOptionsMenuManager._panel.destroy()
		},transistionManager.transitionTime)
});
_panel.add(_button);
