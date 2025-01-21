extends Node2D

enum Stats {NONE, BATTLE, ALL}

var _character: Character
@export
var showStats: Stats = Stats.NONE

func intializeWith(character: Character):
	self._character = character
	$NameContainer/NameLabel.text = character.name
	if character.spritePath.length() > 0:
		$AnimatedSprite2D.sprite_frames = load(character.spritePath)
	update()

func update(time: int = 0):
	match showStats:
		Stats.NONE:
			$BattleStatsContainer.visible = false
			$AllStatsContainer.visible = false
		Stats.BATTLE:
			$BattleStatsContainer.visible = true
			$AllStatsContainer.visible = false
			$BattleStatsContainer/VBoxContainer/TimeToAttackLabel.text = "Attacks in %s" % _character.timeToAttack(time)
			$BattleStatsContainer/VBoxContainer/HPLabel.text = "HP: %s" % _character.health
		Stats.ALL:
			$BattleStatsContainer.visible = false
			$AllStatsContainer.visible = true
			$AllStatsContainer/AllStatsLabel.text = _character.getStatsString()
