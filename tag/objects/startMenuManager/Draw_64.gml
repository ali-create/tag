draw_set_font(defaultFont)
draw_set_valign(fa_middle) 
draw_set_halign(fa_center)

for (i = 0; i < menuLength; i++)
	{
		spacing = 2
		txt = menu[i]
		if(menuCursor == i)
			{
				txt = string_insert(">", txt, 0)
				txt = string_insert(txt, "<", 0)
				color = c_white
			}
		else
			{
				color = c_grey
			}
		xx = menuX
		yy = menuY - menuItemHeight * (i * 1.5)
		
		draw_text(xx,yy,txt)
	}