class_name Enemy extends Character


static var allEnemies: Array = [
	AntiBrella,
	Firewall,
	FireChicken,
	TrojanHorse,
]


func _init(name: String, spritePath: String, stats: Stats) -> void:
	super(name, spritePath, stats)
