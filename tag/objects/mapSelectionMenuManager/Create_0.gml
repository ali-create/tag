global.PlayerGravity = 0.75
global.MapIndex = 0

_panel = new UIPanel("MapSelectionMenu", -400, 0, 380, 450, stoneMenu380x450, UI_RELATIVE_TO.MIDDLE_CENTER);
_panel.setTitle("").setMovable(false).setResizable(false).setDragBarHeight(0);

_button = new UIButton("Map1Button", 0, -100, 250, 80, "[scale, 0.5]Grassland", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButton250x80Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	global.MapIndex = 0
	transistionManager.goToRoomTransistionObject(map2,function()
		{
			mapSelectionMenuManager._panel.destroy()
		},transistionManager.transitionTime)
});
_button.setCallback(UI_EVENT.MOUSE_ENTER, function() {
	mapPreview.sprite_index = map1Preview
})
_button.setCallback(UI_EVENT.MOUSE_EXIT, function() {
	mapPreview.sprite_index = emptyCollider
})

_panel.add(_button);

_button = new UIButton("Map2Button", 0, 20, 250, 80, "[scale, 0.5]Iceland", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButton250x80Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	global.MapIndex = 1
	transistionManager.goToRoomTransistionObject(map3,function()
		{
			mapSelectionMenuManager._panel.destroy()		
		},transistionManager.transitionTime)
});
_button.setCallback(UI_EVENT.MOUSE_ENTER, function() {
	mapPreview.sprite_index = map2Preview
})
_button.setCallback(UI_EVENT.MOUSE_EXIT, function() {
	mapPreview.sprite_index = emptyCollider
})

_panel.add(_button);

_button = new UIButton("Map3Button", 0, 140, 250, 80, "[scale, 0.5]Space", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButton250x80Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	global.MapIndex = 2
	global.PlayerGravity = 0.35
	global.SecretQuickFall = true
	transistionManager.goToRoomTransistionObject(map6,function()
		{
			mapSelectionMenuManager._panel.destroy()
		},transistionManager.transitionTime)
});
_button.setCallback(UI_EVENT.MOUSE_ENTER, function() {
	mapPreview.sprite_index = map4Preview
})
_button.setCallback(UI_EVENT.MOUSE_EXIT, function() {
	mapPreview.sprite_index = emptyCollider
})
_panel.add(_button);



_button = new UIButton("Back", -150, -180, 50, 50, "", stoneButtonX50x50, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButtonX50x50Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	  transistionManager.goToRoomTransistionObject(gamemodeMenu,function()
		{
			mapSelectionMenuManager._panel.destroy()
		},transistionManager.transitionTime)
});
_panel.add(_button);
