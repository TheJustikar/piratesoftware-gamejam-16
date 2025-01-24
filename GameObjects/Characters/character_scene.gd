@tool
class_name CharacterScene extends HBoxContainer

enum Stats {NONE, BATTLE, ALL}

var _character: Character = EvilEye.new()
@export
var showStats: Stats = Stats.NONE
@export
var showName: bool =  true

func _ready() -> void:
	update()

func intializeWith(character: Character):
	self._character = character
	update()

func update(time: int = 0):
	$VBoxContainer/NameContainer/NameLabel.text = _character.name
	$VBoxContainer/NameContainer.visible = showName
	
	if _character.spritePath.length() > 0:
		$VBoxContainer/AnimatedTextureRect.spriteFrames = load(_character.spritePath)
		$VBoxContainer/AnimatedTextureRect.playing = true
	
	match showStats:
		Stats.NONE:
			$VBoxContainer/BattleStatsContainer.visible = false
			$AllStatsContainer.visible = false
		Stats.BATTLE:
			$AllStatsContainer.visible = false
			$VBoxContainer/BattleStatsContainer/VBoxContainer/TimeToAttackLabel.text = "Attacks in %s" % _character.timeToAttack(time)
			$VBoxContainer/BattleStatsContainer/VBoxContainer/HPLabel.text = "HP: %s" % _character.health
			$VBoxContainer/BattleStatsContainer.visible = true
		Stats.ALL:
			$VBoxContainer/BattleStatsContainer.visible = false
			$AllStatsContainer/AllStatsLabel.text = _character.getStatsString()
			$AllStatsContainer.visible = true
