extends Node


var upgrades: Array[Upgrade] = []
var progress: int = 0


func reset():
	upgrades = []
	progress = 0


func player() -> Player:
	return EvilEye.new(upgrades)


func currentEnemy() -> Enemy:
	#TODO check enemy according to progress
	return Firewall.new()
