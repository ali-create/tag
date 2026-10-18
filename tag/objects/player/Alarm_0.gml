/// @description portal out
sprite_index = playerDefault
image_xscale = 1
image_yscale = 1
image_angle = 0
mask_index = playerHitbox
spawnPortalEffect(instance_place(x,y,otherPortal))
with(otherPortal) instance_destroy()
isInPortal = false
portalManager.playerInPortal = false
verticalVelocity = 0
horizontalVelocity = 0
isJumping = 0
freezeMovement = false
allowedControl = true
alarm[1] += iFramesOnPortal
layer_add_instance("Players", self)
