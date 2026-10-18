view_w_half = camera_get_view_width(camera) * 0.5
view_h_half = camera_get_view_height(camera) * 0.5

// find average position
playerCount = array_length(playerManager.players)
sumX = 0
sumY = 0

// used for camera size
xCoordinates = []
yCoordinates = []
for (i = 0; i < playerCount; i++)
	{
		selectedPlayer = playerManager.players[i]
		sumX += selectedPlayer.x 
		sumY += selectedPlayer.y
		array_push(xCoordinates, selectedPlayer.x)
		array_push(yCoordinates, selectedPlayer.y)
	}

averageX = sumX/playerCount
averageY = sumY/playerCount

// find camera size
array_sort(xCoordinates, true)
array_sort(yCoordinates, true)

x1 = xCoordinates[0]
y1 = yCoordinates[0]

x2 = array_last(xCoordinates)
y2 = array_last(yCoordinates)

cameraWidth = x2 - x1 + cameraPadding
cameraHeight = y2 - y1 + cameraPadding
cameraZoom = min(max(cameraZoomMin,(cameraWidth + cameraHeight) / 1 + cameraPadding),cameraZoomMax) 




//cameraX = min(max(averageX - view_w_half, cameraXBoundries[0]),cameraXBoundries[1])
cameraX = room_width/2 - view_w_half
cameraY = min(max(averageY - view_h_half, cameraYBoundries[0]),cameraYBoundries[1])

smoothCameraX = lerp(smoothCameraX, cameraX, cameraSmoothing)
smoothCameraY = lerp(smoothCameraY, cameraY, cameraSmoothing)
smoothCameraZoom = lerp(smoothCameraZoom, cameraZoom, cameraSmoothing)

camera_set_view_size(camera, smoothCameraZoom * aspectRatio, smoothCameraZoom)
camera_set_view_pos(camera, smoothCameraX, smoothCameraY)

layerXOffset = 0
layerYOffset = 200
layerScale   = 1.2

switch (global.MapIndex)
	{
		case 0 :
			layerYOffset += 400
		break;
		case 1: 
			layerScale = -0.1
			layerYOffset = 300
		break;
		case 2: break;
	}

// parallax
backgroundLayer = layer_get_id("Background")
backgroundLayer = layer_background_get_id(backgroundLayer)

layer_background_xscale(backgroundLayer, layerScale + smoothCameraZoom*0.001)
layer_background_yscale(backgroundLayer, layerScale + smoothCameraZoom*0.001)

layer_y(layer_get_id("Background"),smoothCameraY/3-layerYOffset)