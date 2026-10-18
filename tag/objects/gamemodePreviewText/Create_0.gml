textPreviewPanel = new UIPanel("TextPreviewPanel", 0, 200, 600, 100, emptyCollider, UI_RELATIVE_TO.MIDDLE_CENTER);
textPreviewPanel.setTitle("").setMovable(false).setResizable(false).setDragBarHeight(0);

textScale = "[scale, 0.4]"
text = ""
textPreview = new UIText("TextPreview", 0,0,"", UI_RELATIVE_TO.MIDDLE_CENTER)
textPreview.setMaxWidth(530)
textPreviewPanel.add(textPreview)

gamemodeClassic = "Classic: Regular tag"
gamemodeManhunt = "Manhunt: Players get infected on tag, last player standing wins"
gamemodePoints = "Points: Gain points by being near the tagged person, lose points on tag, gain points tagging others"

text = textScale + gamemodeClassic