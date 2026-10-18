scribble_font_bake_outline_and_shadow("defaultFont", "outlineFont" , 1, 1, SCRIBBLE_OUTLINE.EIGHT_DIR_THICK, 1, false)
scribble_font_set_default("outlineFont")
global.windowWidth = 1366
global.windowHeight = 768
game_set_speed(60, gamespeed_fps)

_panel = new UIPanel("TestPanel", 0, 150, 380, 450, stoneMenu380x450, UI_RELATIVE_TO.MIDDLE_CENTER);
_panel.setTitle("").setMovable(false).setResizable(false).setDragBarHeight(0);

_button = new UIButton("PlayButton", 0, -120, 250, 80, "[scale, 0.8]Play", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButton250x80Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	transistionManager.goToRoomTransistionObject(gameOptionsMenuNew,function()
		{
			startMenuManagerNew._panel.destroy()
		},transistionManager.transitionTime)
	
});
_panel.add(_button);

_button = new UIButton("OptionsButton", 0, -30, 250, 80, "[scale, 0.8]Options", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButton250x80Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
    // do nothing
});
// _panel.add(_button);

_button = new UIButton("QuitButton", 0, 60, 250, 80, "[scale, 0.8]Quit", stoneButton250x80, UI_RELATIVE_TO.MIDDLE_CENTER);
_button.setSpriteMouseover(stoneButton250x80Down)
_button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
	game_end()
});
if (os_type == os_windows)	_panel.add(_button);
