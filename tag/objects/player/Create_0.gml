horizontalVelocity = 0
verticalVelocity = 0
speedMult = 10
gravityConstant = global.PlayerGravity
gravityFlip = 1
jumpDuration = 150
jumpVelocity = 23
jumpRingVelocity = 28
coyoteTime = 200
doubleJumpingAllowed = false
usedDoubleJump = false
isJumping = 0
endJumpTime = 0
allowedControl = false
freezeMovement = false
quickFallEnabled = global.SecretQuickFall
sideKeyPressed = false
quickFallCounter = 0
quickFallThreshold = 2
classicMovement = global.SecretClassicMovement
advancedCollision = true
playerSize = 1 // DO NOT CHANGE
isInPortal = false
portalStep = 0
portalDuration = 1
iFramesOnTag = 1 * game_get_speed(gamespeed_fps)
iFramesOnPortal = 1.25 * game_get_speed(gamespeed_fps)
isIFrame = false

tagCooldown = 5000
tagCooldownTime = 0
isTagged = false
allowTagging = true
playerNum = 0
jumpRingAllowed = false
isGrounded = false
timeSinceNotGrounded = 0
otherPortal = undefined
startPortalX = 0
startPortalY = 0
distancePoints = 0

xSquashScale = 150
ySquashScale = 90
smoothXSquash = 0
smoothYSquash = 0
skew_amount = 0
xJiggle = 0
yJiggle = 0
jiggleDuration = 0
jiggleEndTime=0

image_speed = 0
image_xscale = playerSize
image_yscale = playerSize

mask_index = playerHitbox

spawnPortalEffect = function(portal) 
	{
		with (portal) 
			{
				spawnX = sprite_width / 2 + x
				spawnY = sprite_height / 2 + y
				effect = instance_create_layer(spawnX,spawnY, "Effects",portalEffect)
			}
	}
	
jiggleSprite = function(_xJiggle,_yJiggle,_jiggleDuration) 
	{
		xJiggle = _xJiggle
		yJiggle = _yJiggle
		jiggleEndTime = current_time + _jiggleDuration
		jiggleDuration = _jiggleDuration
	}