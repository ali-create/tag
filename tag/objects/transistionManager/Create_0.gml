// black bars
barHeight = 0
startTransistion = false
endTransistion = false
transistionLength = 0
transistionTicks = 0
transistionOvershoot = 1.3
nextRoom = undefined
transistionFunction = undefined
transitionTime = 0.2

goToRoomTransistionObject = function (_room, _transistionFunction, _transistionLength = 0.5) 
	{
		alarm[0] = _transistionLength * game_get_speed(gamespeed_fps)
		if (keyboard_check(vk_shift)) alarm[0] = 1
		startTransistion = true
		transistionLength = _transistionLength
		nextRoom = _room
		transistionFunction = argument[1]
	}