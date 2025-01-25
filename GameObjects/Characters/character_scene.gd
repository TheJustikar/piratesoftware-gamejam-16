@tool
class_name CharacterScene extends HBoxContainer

enum StatsDisplay {NONE, BATTLE, ALL}

var _character: Character = EvilEye.new()
var _previewedUpgrade: Upgrade


@export
var showStats: StatsDisplay = StatsDisplay.NONE
@export
var showName: bool = true
@export
var showHpBarOnRight = false

func _ready() -> void:
	update()

func intializeWith(character: Character):
	self._character = character
	$HPContainer/CenterContainer/HPBar.max_value = character.stats.health
	$MainContainer/TimeToAttackBar.max_value = character.stats.hitRate
	update()

func update(time: int = 0):
	$MainContainer/NameContainer/NameLabel.text = _character.name
	$MainContainer/NameContainer.visible = showName
	
	if showHpBarOnRight:
		move_child($HPContainer, 1)
	else:
		move_child($HPContainer, 0)
	
	if _character.spritePath.length() > 0:
		$MainContainer/AnimatedTextureRect.spriteFrames = load(_character.spritePath)
		$MainContainer/AnimatedTextureRect.playing = true
	
	match showStats:
		StatsDisplay.NONE:
			$HPContainer.visible = false
			$MainContainer/TimeToAttackBar.visible = false
			$AllStatsContainer.visible = false
		StatsDisplay.BATTLE:
			$AllStatsContainer.visible = false

			$HPContainer/CenterContainer/HPBar.value = _character.stats.health
			$HPContainer/HPLabel.text = str(_character.stats.health)
			$HPContainer.visible = true
			
			$MainContainer/TimeToAttackBar.value = _character.timeToAttack(time)
			$MainContainer/TimeToAttackBar.visible = true
		StatsDisplay.ALL:
			$HPContainer.visible = false
			$MainContainer/TimeToAttackBar.visible = false
			
			if _previewedUpgrade != null && _character is Player:
				$AllStatsContainer/AllStatsLabel.text = _character.getStatsStringWithUpgrade(_previewedUpgrade)
			else:
				$AllStatsContainer/AllStatsLabel.text = _character.getStatsString()
			$AllStatsContainer.visible = true


func previewUpgrade(upgrade: Upgrade):
	_previewedUpgrade = upgrade
	update()
