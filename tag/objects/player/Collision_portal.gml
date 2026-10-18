// check for other portal
otherPortal = other.portalNum ? portalManager.portals[0] : portalManager.portals[1]

portalDist = point_distance(other.x,other.y,otherPortal.x,otherPortal.y)
portalDuration = max(portalDist/950,1)

alarm[1] = 5 // i frames
sprite_index = playerPortal
mask_index = emptyCollider
other.mask_index = emptyCollider
otherPortal.mask_index = emptyCollider

alarm[0] = portalDuration * game_get_speed(gamespeed_fps)

isInPortal = true
portalManager.playerInPortal = true
layer_add_instance("playerTravelPortal", self)

startPortalX = x
startPortalY = y

spawnPortalEffect(instance_place(x,y,portal))
with(other) instance_destroy()


