extends Node2D

enum Stats {NONE, BATTLE, ALL}

var _character: Character
@export
var showStats: Stats = Stats.NONE
@export
var showName: bool =  true

func _ready() -> void:
	update()

func intializeWith(character: Character):
	self._character = character
	$Control/NameContainer/NameLabel.text = character.name
	if character.spritePath.length() > 0:
		$AnimatedSprite2D.sprite_frames = load(character.spritePath)
	update()

func update(time: int = 0):
	$Control/NameContainer.visible = showName
	match showStats:
		Stats.NONE:
			$Control/BattleStatsContainer.visible = false
			$Control/AllStatsContainer.visible = false
		Stats.BATTLE:
			$Control/AllStatsContainer.visible = false
			if _character != null:
				$Control/BattleStatsContainer/VBoxContainer/TimeToAttackLabel.text = "Attacks in %s" % _character.timeToAttack(time)
				$Control/BattleStatsContainer/VBoxContainer/HPLabel.text = "HP: %s" % _character.health
				$Control/BattleStatsContainer.visible = true
		Stats.ALL:
			$Control/BattleStatsContainer.visible = false
			if _character != null:
				$Control/AllStatsContainer/AllStatsLabel.text = _character.getStatsString()
				$Control/AllStatsContainer.visible = true
