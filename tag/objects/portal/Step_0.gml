if (isFlickering) 
	{
		image_alpha = 1 + flickerScale*sin(current_time/200) - flickerScale - flickerAlphaOffset
	}