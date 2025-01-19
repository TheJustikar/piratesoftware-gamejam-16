extends Node2D

var player: Player
var enemy: Enemy

var currentTime: float = 0

func _ready() -> void:
	player = Global.player()
	enemy = Global.currentEnemy()

func _process(delta: float) -> void:
	#TODO add timer before start
	currentTime += delta
	if player.shouldAttack(int(currentTime)):
		enemy.takeDamage(player.damage)
	if enemy.isAlive():
		if enemy.shouldAttack(int(currentTime)):
			player.takeDamage(enemy.damage)
	else:
		#TODO Round won
		pass
		
	if player.isAlive() == false:
		#TODO Round lost
		pass
