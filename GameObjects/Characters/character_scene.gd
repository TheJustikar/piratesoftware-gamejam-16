extends Node2D

var _character: Character
@export
var showCombatStats: bool = false

func intializeWith(character: Character):
	self._character = character
	$TopCenterContainer/NameLabel.text = character.name
	if character.spritePath.length() > 0:
		$AnimatedSprite2D.sprite_frames = load(character.spritePath)
	update()

func update(time: int = 0):
	$BottomCenterContainer.visible = showCombatStats
	$BottomCenterContainer/VBoxContainer/TimeToAttackLabel.text = "Attacks in %s" % _character.timeToAttack(time)
	$BottomCenterContainer/VBoxContainer/HPLabel.text = "HP: %s" % _character.health
