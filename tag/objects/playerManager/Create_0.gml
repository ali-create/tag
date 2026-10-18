maxPlayerCount = 4
playerCount = global.PlayerAmount
playerCount = min(playerCount, maxPlayerCount)
players = []
taggedPlayer = []
for (i = 0; i < playerCount; i++) 
	{
		array_push(taggedPlayer,0)
	}
taggedPlayer[floor(random_range(0,playerCount))] = 1
selectedPlayer = false
taggedPlayerObject = [0,0,0,0]
taggedPlayersCount = 0
lastTaggedPlayerObject = 0
tagCooldownTime = 0
tagCooldown = 1
pauseMenuToggle = false
playerKeys = 
	{
		p0: [ord("A"), ord("W"), ord("D")],
		p1: [vk_left,vk_up,vk_right],
		p2: [ord("J"), ord("I"), ord("L")],
		p3: [ord("F"), ord("T"), ord("H")],
		
	}

for (i = 0; i<playerCount; i++)
	{
		players[i] = instance_create_layer(spawnpoint.x + i*200,spawnpoint.y,"Players", player)
		with(players[i]) {
			playerNum = other.i
		}
	}
	
function setControl(control) 
	{
		for (i = 0; i < playerCount; i++)
			{
				players[i].allowedControl = control
			}
		
	}
	
function freezeControls(state)
	{
		for (i = 0; i < playerCount; i++)
			{
				players[i].freezeMovement = state
			}
		
	}

function setTagging(state)
	{
		for (i = 0; i < playerCount; i++)
			{
				players[i].allowTagging = state
			}
		
	}

if (global.GamemodeIndex == 2)
	{
	
		infoOffsetX = 40
		infoOffsetY = 60
		spriteSize = 40
		detailsSpacing = 20
		textOffset = 40
		
		_panel = new UIPanel("PointsPanel", -550, 200, 200, 300, stoneMenu200x300, UI_RELATIVE_TO.MIDDLE_CENTER);
		_panel.setTitle("").setMovable(false).setResizable(false);
		
		titleText = new UIText("PointsPanelTitleText", 0, 30, "Points", UI_RELATIVE_TO.TOP_CENTER)
		_panel.add(titleText)
		
		for (i = 0; i < array_length(players); i++)
			{
				spriteY = i*(spriteSize+detailsSpacing) + infoOffsetY
				winnerSprite = new UISprite("PlayerPointSprite", infoOffsetX, spriteY, playerDefault, spriteSize, spriteSize, players[i].playerNum, UI_RELATIVE_TO.TOP_LEFT, time_source_game)
				winnerSprite.setAnimationStep(4)
				_panel.add(winnerSprite)
				
				playerPointsText = new UIText("PlayerPointsText" + string(i), infoOffsetX + spriteSize + textOffset, spriteY + spriteSize/2, "", UI_RELATIVE_TO.TOP_LEFT)
				_panel.add(playerPointsText)
			}
	}

switch (global.MapIndex) 
	{
		case 0:
		break;
		case 1:
		break;
		case 2:
			tipsMenu.showTip("Spam left and right to go down faster")
		break;
	}