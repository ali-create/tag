if (endTransistion) 
	{
		endTransistion = false
	}
if (startTransistion) 
	{
		startTransistion = false
		alarm[0] = transistionLength * game_get_speed(gamespeed_fps)
		if (keyboard_check(vk_shift)) alarm[0] = 1
		endTransistion = true
		script_execute(transistionFunction)
		room_goto(nextRoom)
	}
