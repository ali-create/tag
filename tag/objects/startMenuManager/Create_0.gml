guiWidth = display_get_gui_width()
guiHeight = display_get_gui_height()

menuX = guiWidth/2
menuY = guiHeight/2

menuFont = defaultFont
menuItemHeight = font_get_size(defaultFont)

menuCommited = -1
menuControl = true

menu[2] = "Map 1"
menu[1] = "Map 2"
menu[0] = "Map 3"

menuCursor = 2
cursorSelectCooldown = 0
menuLength = array_length(menu)
