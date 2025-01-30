@tool
class_name CharacterScene extends HBoxContainer


enum StatsDisplay {NONE, BATTLE, ALL}


var _character: Character
var _previewedUpgrade: Upgrade


@export
var showStats: StatsDisplay = StatsDisplay.NONE:
	set(newShowStats):
		if showStats != newShowStats:
			showStats = newShowStats
			match showStats:
				StatsDisplay.NONE:
					$HPContainer.visible = false
					$MainContainer/TimeToAttackBar.visible = false
					$AllStatsContainer.visible = false
				StatsDisplay.BATTLE:
					$AllStatsContainer.visible = false
					$HPContainer.visible = true
					$MainContainer/TimeToAttackBar.visible = true
				StatsDisplay.ALL:
					$HPContainer.visible = false
					$MainContainer/TimeToAttackBar.visible = false
					$AllStatsContainer.visible = true
@export
var showName: bool = true:
	set(newShowName):
		if showName != newShowName:
			showName = newShowName
			$MainContainer/NameContainer.visible = showName
@export
var showHpBarOnRight = false:
	set(newShowHpBarOnRight):
		if showHpBarOnRight != newShowHpBarOnRight:
			showHpBarOnRight = newShowHpBarOnRight
			move_child($HPContainer, 1 if showHpBarOnRight else 0)


func _ready() -> void:
	move_child($HPContainer, 1 if showHpBarOnRight else 0)
	$MainContainer/NameContainer.visible = showName
	match showStats:
		StatsDisplay.NONE:
			$HPContainer.visible = false
			$MainContainer/TimeToAttackBar.visible = false
			$AllStatsContainer.visible = false
		StatsDisplay.BATTLE:
			$AllStatsContainer.visible = false
			$HPContainer.visible = true
			$MainContainer/TimeToAttackBar.visible = true
		StatsDisplay.ALL:
			$HPContainer.visible = false
			$MainContainer/TimeToAttackBar.visible = false
			$AllStatsContainer.visible = true


func intializeWith(character: Character):
	self._character = character
	update()


func updateWithTime(time: int):
	update()
	if _character != null && showStats == StatsDisplay.BATTLE:
		$MainContainer/TimeToAttackBar.value = _character.timeToAttack(time)


func update():
	if _character == null:
		return
	
	$MainContainer/NameContainer/NameLabel.text = _character.name
	
	if _character.spriteResource != null &&\
		$MainContainer/AnimatedTextureRect.spriteFrames != _character.spriteResource:
		$MainContainer/AnimatedTextureRect.spriteFrames = _character.spriteResource
		$MainContainer/AnimatedTextureRect.play()
	
	match showStats:
		StatsDisplay.BATTLE:
			$HPContainer/CenterContainer/HPBar.max_value = _character.stats.health
			$HPContainer/CenterContainer/HPBar.value = _character.currentHealth
			$HPContainer/HPLabel.text = str(_character.currentHealth)
			$MainContainer/TimeToAttackBar.max_value = _character.stats.hitRate
		StatsDisplay.ALL:
			if _previewedUpgrade != null && _character is Player:
				$AllStatsContainer/AllStatsLabel.text = _character.getStatsStringWithUpgrade(_previewedUpgrade)
			else:
				$AllStatsContainer/AllStatsLabel.text = _character.getStatsString()


func previewUpgrade(upgrade: Upgrade):
	_previewedUpgrade = upgrade
	update()
