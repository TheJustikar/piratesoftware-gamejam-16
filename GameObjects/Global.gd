extends Node

var upgrades: Array[Upgrade] = []
var progress: int = 0

func reset():
	upgrades = []
	progress = 0
	
func player() -> Player:
	return Player.new(upgrades, 100, 0, 15, 10)
	
func currentEnemy() -> Enemy:
	#TODO check enemy according to progress
	return Enemy.new(100, 0, 10, 15)
