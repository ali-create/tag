function setBackground(background){
	switch (global.StartScreenBackground)
	{
		case 0:
			layer_background_sprite(background, background_map_1)
		break
		case 1:
			layer_background_sprite(background, map2_background)
		break
	}

}