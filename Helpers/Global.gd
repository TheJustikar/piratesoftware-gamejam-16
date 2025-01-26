extends Node


const maxProgress: int = 10


var player: Player = EvilEye.new()
var upgrades: Array[Upgrade] = []
var progress: int = 0


func reset():
	upgrades = []
	progress = 0
	player = EvilEye.new()


func currentEnemy() -> Enemy:
	#TODO check enemy according to progress
	return Firewall.new()
