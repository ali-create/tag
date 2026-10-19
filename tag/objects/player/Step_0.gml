inputs = struct_get(playerManager.playerKeys, "p" + string(playerNum))

image_index = playerNum

left = 0
right = 0
jump = 0
groundJump = false

if(isInPortal)	
	{
		freezeMovement = true
		allowedControl = false
		pointDist = 1-(alarm[0]/game_get_speed(gamespeed_fps))/portalDuration
		
		image_angle = pointDist * 360 * 3
		scale = sin(pointDist*pi) * 3
		image_xscale = scale
		image_yscale = scale
		
		pos = pointAtDistance(
			startPortalX,
			startPortalY,
			otherPortal.x,
			otherPortal.y,
			pointDist
		)
		x = pos.x
		y = pos.y
		
	}


if (allowedControl == true) 
{
	left = keyboard_check(inputs[0])
	right = keyboard_check(inputs[2])
	jump = keyboard_check(inputs[1])
}

if (freezeMovement == false) 
	{

		if (!classicMovement) horizontalVelocity = (right - left) * speedMult;
		if (classicMovement ) horizontalVelocity = lerp(horizontalVelocity, (right - left) * speedMult, 0.2)
			
		verticalVelocity = verticalVelocity + (gravityConstant * gravityFlip)
	}


// quickfall
if (!sideKeyPressed and (left or right) and ((!left and right) or (left and !right)))
	{
		sideKeyPressed = true
		quickFallCounter += 1
		if (quickFallCounter > quickFallThreshold and quickFallEnabled) 
			{
				verticalVelocity += 3 + min(quickFallCounter/1.2,12)
			}
	}
if ((!left and !right) or (left and right and sideKeyPressed == true))
	{
		sideKeyPressed = false
	}
if (isGrounded) 
	{
		quickFallCounter = 0
	}
	
// jump ring
if (!isJumping)
	{
		jumpRingAllowed = true
	}
if (place_meeting(x,y, jumpRing))
	{
	if (jump and jumpRingAllowed and !usedJumpRing)
		{
			verticalVelocity = -jumpRingVelocity * gravityFlip
			jumpRingAllowed = false
			usedJumpRing = true
			isJumping = true
			endJumpTime = current_time + jumpDuration
			quickFallCounter = 0
			jiggleSprite(0.6,-1,200)
			with (instance_place(x,y,jumpRing)) 
			{
				spawnX = x
				spawnY = y
				effect = instance_create_layer(spawnX,spawnY, "Effects",jumpRingEffect)
			}
			
		}
	}
	else
		{
			usedJumpRing = false
			jumpRingAllowed = false
		}

// gravity ring
if (!isJumping)
	{
		jumpRingAllowed = true
	}
if (place_meeting(x,y, gravityRing))
	{
	if (jump and jumpRingAllowed and !usedJumpRing)
		{
			gravityFlip = gravityFlip = -1 ? 1 : -1
			isJumping = true
			jumpRingAllowed = false
			usedJumpRing = true
			endJumpTime = current_time + jumpDuration
			quickFallCounter = 0
			with (instance_place(x,y,gravityRing)) 
			{
				spawnX = sprite_width / 2 + x
				spawnY = sprite_height / 2 + y
				effect = instance_create_layer(spawnX,spawnY, "Effects",gravityRingEffect)
			}
		}
	}
	else
		{
			usedJumpRing = false
			jumpRingAllowed = false
		}


if (!advancedCollision) {
	// horizontal collision
	if (place_meeting(x+horizontalVelocity,y,tile)) 
			{

					while (!place_meeting(x+sign(horizontalVelocity),y,tile)) 
						{
							x = x + sign(horizontalVelocity)
						}
					horizontalVelocity = 0
			}		
	if (freezeMovement == false) x = x + horizontalVelocity
	
	// vertical collision
	if (place_meeting(x,y+verticalVelocity,tile)) 
			{
					while (!place_meeting(x,y+sign(verticalVelocity),tile)) 
						{
							y = y + sign(verticalVelocity)
						}
					verticalVelocity = 0
					
			}		
	if (freezeMovement == false) y = y + verticalVelocity	
}	
	// advanced collision
	else {
		
		if (freezeMovement == false) moveCollideArr = move_and_collide(horizontalVelocity,verticalVelocity,tile,8,0,0,speedMult,-1)
		if(array_length(moveCollideArr) != 0 and place_meeting(x,y +verticalVelocity, tile)) 
		{
					if (verticalVelocity > 5) jiggleSprite(verticalVelocity/32,-verticalVelocity/32,verticalVelocity*10)
					if (-verticalVelocity > 5) jiggleSprite(-verticalVelocity/32,verticalVelocity/32,-verticalVelocity*10)
					verticalVelocity = 0
		}
		
			
}

// jump
if (isGrounded or (!isJumping and timeSinceNotGrounded+coyoteTime > current_time)) and jump 
	{
		if (!freezeMovement)
		{
			
			timeSinceNotGrounded = -999999
			if (!isGrounded) timeSinceNotGrounded = -999999
			verticalVelocity = gravityFlip = 1 ? -jumpVelocity : jumpVelocity
			isJumping = 1
			endJumpTime = current_time + jumpDuration
			jiggleSprite(0.6,-1,200)
		}
	}

// double jump
if (doubleJumpingAllowed and !isJumping and jump and !isGrounded) 
	{
		doubleJumpingAllowed = false
		isJumping = 1
		verticalVelocity = gravityFlip = 1 ? -jumpVelocity : jumpVelocity
		isJumping = 1
		endJumpTime = current_time + jumpDuration
		jiggleSprite(0.6,-1,200)
		spawnEffect(x,y+image_yscale/2,doubleJumpEffectSprite,0.4,0,false,0,750)
	}

// variable jump
if (!jump and isJumping)
	{
		verticalVelocity = verticalVelocity * 0.5
		isJumping = 0
	}

// is grounded check
if (place_meeting(x, y+1*gravityFlip,tile) and verticalVelocity >=0)	
	{
		if(global.SecretDoubleJump) doubleJumpingAllowed = true
		isGrounded = true
		timeSinceNotGrounded = current_time
	}
	else
	{
		isGrounded = false
	}
// points system
for (i = 0; i < array_length(playerManager.taggedPlayerObject); i++) 
	{
		object =  playerManager.taggedPlayerObject[i]
		if (object != 0 and object != self and allowedControl and global.GamemodeIndex == 2)
			{
				distancePoints = max(distancePoints + min(0.7/distance_to_object(object),0.2), 0)
				distancePointsText = "[scale, 0.7]" + string(distancePoints)
				ui_get("PlayerPointsText"+string(playerNum)).setText(distancePointsText).setTextMouseover(distancePointsText).setTextClick(distancePointsText)
			}
	}

// i frames
if(alarm[1] > 0) isIFrame = true

// animations
if (!isInPortal) {
	xSquash = playerSize - horizontalVelocity/xSquashScale 
	ySquash = playerSize - verticalVelocity/ySquashScale
	
	if (verticalVelocity>0) 
		{
			xSquash = xSquash - verticalVelocity/xSquashScale 
			ySquash = ySquash - horizontalVelocity/ySquashScale
		}
	if (jiggleEndTime > current_time) 
		{
			jigglePoint = jiggleDuration - (jiggleEndTime - current_time)
			xSquash = xSquash + sin(jigglePoint/30) * xJiggle * (1-jigglePoint/jiggleDuration)
			ySquash = ySquash + sin(jigglePoint/30) * yJiggle * (1-jigglePoint/jiggleDuration)
			xSquash = lerp(max(xSquash,0.3),xSquash,0.2)
			ySquash = lerp(max(ySquash,0.3),xSquash,0.2)
		}
	}
	else
	{
		xSquash = 0
		ySquash = 0
	}
	smoothXSquash = lerp(smoothXSquash, xSquash, 0.3)
	smoothYSquash = lerp(smoothYSquash, ySquash, 0.3)
	skew_amount = lerp(skew_amount, horizontalVelocity, 0.2)

