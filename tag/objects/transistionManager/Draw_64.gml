draw_set_colour(c_black)
if (startTransistion) 
	{
		

		
		transistionTicks = transistionLength * game_get_speed(gamespeed_fps)
		draw_set_colour(c_black)
		draw_set_alpha(1-alarm[0]/transistionTicks)
		draw_rectangle(0,0,9999,9999,false)
		draw_set_alpha(1)		

		/*
		topBarHeight = (window_get_height()/2) * ((transistionPoint-alarm[0]*transistionOvershoot) / transistionPoint)
		bottomBarHeight = (window_get_height()/2) * (alarm[0]*transistionOvershoot / transistionPoint) + window_get_height
		
		draw_rectangle(0,0,window_get_width(),topBarHeight,false)
		draw_rectangle(0,window_get_height(),window_get_width(),bottomBarHeight,false)
		*/
		
		
	}
if (endTransistion) 
	{
		
		transistionTicks = transistionLength * game_get_speed(gamespeed_fps)
		draw_set_colour(c_black)
		draw_set_alpha(alarm[0]/transistionTicks)
		draw_rectangle(0,0,9999,9999,false)
		draw_set_alpha(1)
		
		/*
		topBarHeight = (window_get_height()/2) * (alarm[0]*transistionOvershoot / transistionPoint)
		bottomBarHeight = (window_get_height()/2) * ((transistionPoint-alarm[0]*transistionOvershoot) / transistionPoint) + window_get_height
		
		draw_rectangle(0,0,window_get_width(),topBarHeight,false)
		draw_rectangle(0,window_get_height(),window_get_width(),bottomBarHeight,false)
		*/
		
		
	}

//show_debug_message(window_get_width())
//show_debug_message(window_get_height())