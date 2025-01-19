class_name Upgrade

var name: String
var health: int
#Damage prevention in percent
var defense: int
var damage: int
var hitRate: int

func _init(name: String, health: int, defense: int, damage: int, hitRate: int) -> void:
	self.name = name
	self.health = health
	self.defense = defense
	self.damage = damage
	self.hitRate = hitRate


func getStatsString() -> String:
	var stats = ""
	if health != 0:
		stats += "Health: %s" % health
	if defense != 0:
		if stats.is_empty() == false:
			stats += "\n"
		stats += "Defense: %s" % defense
	if damage != 0:
		if stats.is_empty() == false:
			stats += "\n"
		stats += "Damage: %s" % damage
	if hitRate != 0:
		if stats.is_empty() == false:
			stats += "\n"
		stats += "Hit Rate: %s" % hitRate
	
	if stats.is_empty():
		stats = "Nothing"
	return stats
