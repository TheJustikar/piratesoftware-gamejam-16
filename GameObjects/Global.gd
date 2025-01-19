extends Node


var upgrades: Array[Upgrade] = []
var progress: int = 0


func reset():
	upgrades = []
	progress = 0


func player() -> Player:
	return Player.new(upgrades, "test", 100, 0, 10, 10)


func currentEnemy() -> Enemy:
	#TODO check enemy according to progress
	return Enemy.new("test", 100, 0, 10, 15)
