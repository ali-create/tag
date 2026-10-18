global.PlayerGravity = 0.75
global.MapIndex = 0
global.GamemodeIndex = 0
global.SecretQuickFall = 0
global.SecretClassicMovement = 1
global.SecretDoubleJump = 0
global.TimeAmountIndex = 1
global.PlayerAmount = 2

playerControls = ["AWD","Arrows","JIL","FTH"]

drawPlayers = function (playerCount, grid, row, column) 
	{
		for (i = 0; i < 4 ; i++) if (ui_exists("PlayerSprite" + string(i))) ui_get("PlayerSprite" + string(i)).destroy()
		for (i = 0; i < 4 ; i++) if (ui_exists("PlayerSpriteControls" + string(i))) ui_get("PlayerSpriteControls" + string(i)).destroy()
		for (i = 0; i < playerCount; i++) {
			spriteX = (i-(playerCount-1)/2)*100
			playerSprite = new UISprite("PlayerSprite" + string(i), spriteX, 100, playerDefault, 40, 40, i, UI_RELATIVE_TO.MIDDLE_CENTER, time_source_game)
			playerSprite.setAnimationStep(4)
			
			playerSpriteControls = new UIText("PlayerSpriteControls" + string(i), spriteX, 50, "[scale,0.45]" + playerControls[i], UI_RELATIVE_TO.MIDDLE_CENTER)
			grid.addToCell(playerSprite,row,column)	
			grid.addToCell(playerSpriteControls,row,column)	
		}
	}

// left side panel
leftSidePanel = new UIPanel("LeftSidePanel",-125,0,550,900,stoneMenu550x950,UI_RELATIVE_TO.MIDDLE_LEFT)
leftSidePanel.setResizable(false).setDraggable(false).setDragBarHeight(0)
leftSideGrid = new UIGrid("LeftSideGrid",7,1)
leftSideGrid.setMargins(75)
leftSideGrid.setMarginLeft(160)
leftSideGrid.setMarginTop(30)
leftSidePanel.add(leftSideGrid);

text = new UIText("AmountOfPlayersText", 0, 50, "[scale, 0.6]Amount of players",  UI_RELATIVE_TO.MIDDLE_CENTER)
leftSideGrid.addToCell(text,0,0)

// amount of players
gamePlayers = new UIOptionGroup("GamePlayers", 0, 0,  ["[scale, 0.5]2","[scale, 0.5]3","[scale, 0.5]4"], checkBox,, UI_RELATIVE_TO.MIDDLE_CENTER)
gamePlayers.setSpriteSelected(checkBoxFilled).setImageMouseover(1).setSpriteMouseover(checkBoxDown)
gamePlayers.setVertical(false);
gamePlayers.setCallback(UI_EVENT.LEFT_RELEASE, function() {
		drawPlayers(gamePlayers.getIndex()+2,leftSideGrid,1,0)
	})

leftSideGrid.addToCell(gamePlayers,1,0)

drawPlayers(2,leftSideGrid,1,0)


text = new UIText("TimeAmountText", 0, 50, "[scale, 0.6]Time amount",  UI_RELATIVE_TO.MIDDLE_CENTER)
leftSideGrid.addToCell(text,2,0)

// time amount
// TODO: change to slider
timeAmount = new UIOptionGroup("TimeAmount", 0, 0, ["[scale,0.5]60","[scale,0.5]120","[scale,0.5]180","[scale,0.5]240"], checkBox,, UI_RELATIVE_TO.MIDDLE_CENTER)
timeAmount.setSpriteSelected(checkBoxFilled).setImageMouseover(1).setSpriteMouseover(checkBoxDown)
timeAmount.setVertical(false);
leftSideGrid.addToCell(timeAmount,3,0)

gamePlayers.setIndex(0)
timeAmount.setIndex(1)

text = new UIText("GamemodeText", 0, 0, "[scale, 0.6]Gamemode",  UI_RELATIVE_TO.MIDDLE_CENTER)
leftSideGrid.addToCell(text,4,0)

// gamemode selection
gamemode = new UIOptionGroup("Gamemodes", 0, 0,  ["[scale, 0.8]Classic","[scale, 0.8]Manhunt","[scale, 0.8]Points"], checkBox,, UI_RELATIVE_TO.MIDDLE_CENTER)
gamemode.setSpriteSelected(checkBoxFilled).setImageMouseover(1).setSpriteMouseover(checkBoxDown)
gamemode.setVertical(true);
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
			textPreview.setText("[scale, 0.5]" + text)
		}
});

leftSideGrid.addToCell(gamemode,5,0)

gamemode.setIndex(0)
gamemode.setVertical(true);

// extras
extrasButton = new UIButton("ExtrasButton", 0,20,164,80,"[scale, 0.7]Extras",timerBack,UI_RELATIVE_TO.MIDDLE_LEFT)
extrasButton.setCallback(UI_EVENT.LEFT_RELEASE,function()
	{
		secretPanelVisible = secretPanelVisible ? 0 : 1
		secretPanel.setVisible(secretPanelVisible)
	})
leftSideGrid.addToCell(extrasButton,6,0)

// secrets panel
secretPanelVisible = false
secretPanel = new UIPanel("Secrets", 0, -100, 380, 450, stoneMenu380x450, UI_RELATIVE_TO.MIDDLE_CENTER);
secretPanel.setTitle("Extras").setMovable(false).setResizable(false).setDragBarHeight(0);
secretPanel.setVisible(secretPanelVisible)

quickFallCheckBox = new UICheckbox("QuickFallCheckBox", 30, 50, "quick fall", checkBoxFilled, checkBox, global.SecretQuickFall);
secretPanel.add(quickFallCheckBox);

classicMovementCheckBox = new UICheckbox("ClassicMovementCheckBox", 30, 120, "[scale, 0.6]classic movement", checkBoxFilled, checkBox, global.SecretClassicMovement);
secretPanel.add(classicMovementCheckBox);

doubleJumpCheckbox = new UICheckbox("DoubleJumpCheckBox", 30, 190, "[scale, 0.6]double jump", checkBoxFilled, checkBox, global.SecretDoubleJump);
secretPanel.add(doubleJumpCheckbox);

closeButton = new UIButton("SecretPanelCloseButton",0, 200, 250,80,"[scale,0.7]Close",stoneButton250x80,UI_RELATIVE_TO.MIDDLE_CENTER)
closeButton.setSpriteMouseover(stoneButton250x80Down)
closeButton.setCallback(UI_EVENT.LEFT_RELEASE, function() 
	{
		secretPanelVisible = false
		secretPanel.setVisible(secretPanelVisible)
	})
secretPanel.add(closeButton);

// back
_button = new UIButton("Back", 130, 70, 50, 50, "", stoneButtonX50x50, UI_RELATIVE_TO.TOP_LEFT);
_button.setSpriteMouseover(stoneButtonX50x50Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	transistionManager.goToRoomTransistionObject(startMenu,function()
		{
			gameOptionManagerNew.leftSidePanel.destroy()
			gameOptionManagerNew.rightSidePanel.destroy()
			gameOptionManagerNew.playPanel.destroy()
			gamemodePreviewText.textPreviewPanel.destroy()
			gameOptionManagerNew.secretPanel.destroy()
		},transistionManager.transitionTime)
});
leftSidePanel.add(_button);

// right side panel
rightSidePanel = new UIPanel("RightSidePanel",155,0,600,900,stoneMenu550x950,UI_RELATIVE_TO.MIDDLE_RIGHT)
rightSidePanel.setResizable(false).setDraggable(false).setDragBarHeight(0)
rightSideGrid = new UIGrid("RightSideGrid",7,1)
rightSideGrid.setMargins(75)
rightSideGrid.setMarginRight(120)
rightSidePanel.add(rightSideGrid);

text = new UIText("MapText", 0, 0, "[scale, 1]Map",  UI_RELATIVE_TO.MIDDLE_CENTER)
rightSideGrid.addToCell(text,0,0)

maps = [map2,map3,map6]

// grasslands
_button = new UIButton("Map1Button", 0, 0, 250, 80, "[scale, 0.5]Grassland", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButton250x80Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	global.MapIndex = 0
});

rightSideGrid.addToCell(_button,1,0)

// iceland
_button = new UIButton("Map2Button", 0, 0, 250, 80, "[scale, 0.5]Iceland", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButton250x80Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	global.MapIndex = 1
});

rightSideGrid.addToCell(_button,2,0)

// space
_button = new UIButton("Map3Button", 0, 0, 250, 80, "[scale, 0.5]Space", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButton250x80Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	global.MapIndex = 2
	quickFallCheckBox.setValue(true)
});

rightSideGrid.addToCell(_button,3,0)

// play button
playPanel = new UIPanel("PlayPanel",0,300,300,300,emptyCollider,UI_RELATIVE_TO.MIDDLE_CENTER)
playPanel.setMovable(false).setResizable(false).setDragBarHeight(0);
playButton = new UIButton("PlayButton",0, 0, 250, 80, "[scale, 1]Play", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
playButton.setCallback(UI_EVENT.LEFT_RELEASE, function() 
	{
		global.GamemodeIndex = gamemode.getIndex()
		global.TimeAmountIndex = timeAmount.getIndex()
		global.PlayerAmount = gamePlayers.getIndex() + 2
		
		switch (global.MapIndex) 
			{
				case 0:
				break;
				case 1:
				break;
				case 2:
					global.PlayerGravity = 0.35
				break;
			}
		
		global.SecretQuickFall = quickFallCheckBox.getValue()
		global.SecretClassicMovement = classicMovementCheckBox.getValue()
		global.SecretDoubleJump = doubleJumpCheckbox.getValue()
		
		transistionManager.goToRoomTransistionObject(maps[global.MapIndex],function()
		{
			gameOptionManagerNew.leftSidePanel.destroy()
			gameOptionManagerNew.rightSidePanel.destroy()
			gameOptionManagerNew.playPanel.destroy()
			gamemodePreviewText.textPreviewPanel.destroy()
			gameOptionManagerNew.secretPanel.destroy()
		},transistionManager.transitionTime)
	})

playPanel.add(playButton)

