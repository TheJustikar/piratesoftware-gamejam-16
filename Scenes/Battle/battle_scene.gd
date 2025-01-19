extends Node2D

var player: Player
var enemy: Enemy

var currentTime: float = 0
var lastPlayerHit: int = -1
var lastEnemyHit: int = -1

func _ready() -> void:
	player = Global.player()
	enemy = Global.currentEnemy()

func _process(delta: float) -> void:
	#TODO add timer before start
	currentTime += delta * 5
	var timeStep = int(currentTime)
	$TimeLabel.text = "Current time: %s" % timeStep
	$Player/TimeTillAttackLabel.text = "Attacks in %s" % player.timeTillAttack(timeStep)
	$Enemy/TimeTillAttackLabel.text = "Attacks in %s" % enemy.timeTillAttack(timeStep)
	if lastPlayerHit != timeStep && player.shouldAttack(timeStep):
		enemy.takeDamage(player.damage)
		lastPlayerHit = timeStep
		$Enemy/HPLabel.text = "HP: %s" % enemy.health
		
	if enemy.isAlive():
		if lastEnemyHit != timeStep && enemy.shouldAttack(timeStep):
			player.takeDamage(enemy.damage)
			lastEnemyHit = timeStep
			$Player/HPLabel.text = "HP: %s" % player.health
			
	else:
		Global.progress += 1
		get_tree().change_scene_to_file("res://Scenes/Upgrade/UpgradeScene.tscn")
		return
		
	if player.isAlive() == false:
		get_tree().change_scene_to_file("res://Scenes/GameOver/GameOverScene.tscn")
		return
