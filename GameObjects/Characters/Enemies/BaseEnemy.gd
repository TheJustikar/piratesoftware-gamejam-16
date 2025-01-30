class_name Enemy extends Character


static var allEnemies: Array = [
	#AntiBrella,
	Firewall,
	FireChicken,
	TrojanHorse,
]


func _init(name: String, spritePath: String, stats: Stats) -> void:
	super(name, spritePath, stats)


static func calculateMultiplyer(
	base: int,	level: int, percentage: float) -> int:
	var multiplyer = level * percentage
	return int(base * (1 + multiplyer))
