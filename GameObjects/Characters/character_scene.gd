extends Node2D

enum Stats {NONE, BATTLE, ALL}

var _character: Character
@export
var showStats: Stats = Stats.NONE

func intializeWith(character: Character):
	self._character = character
	$Control/NameContainer/NameLabel.text = character.name
	if character.spritePath.length() > 0:
		$AnimatedSprite2D.sprite_frames = load(character.spritePath)
	update()

func update(time: int = 0):
	match showStats:
		Stats.NONE:
			$Control/BattleStatsContainer.visible = false
			$Control/AllStatsContainer.visible = false
		Stats.BATTLE:
			$Control/BattleStatsContainer.visible = true
			$Control/AllStatsContainer.visible = false
			$Control/BattleStatsContainer/VBoxContainer/TimeToAttackLabel.text = "Attacks in %s" % _character.timeToAttack(time)
			$Control/BattleStatsContainer/VBoxContainer/HPLabel.text = "HP: %s" % _character.health
		Stats.ALL:
			$Control/BattleStatsContainer.visible = false
			$Control/AllStatsContainer.visible = true
			$Control/AllStatsContainer/AllStatsLabel.text = _character.getStatsString()
