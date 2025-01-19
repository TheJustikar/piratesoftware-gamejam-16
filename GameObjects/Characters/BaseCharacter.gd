class_name Character


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


func shouldAttack(currentTime: int) -> bool: 
	return currentTime != 0 && currentTime % self.hitRate == 0


func timeTillAttack(currentTime: int) -> int: return self.hitRate - (currentTime % self.hitRate)


func takeDamage(damage: int): 
	var totalDamage = int(damage * (1 - clamp(self.defense / 100.0, -0.9, 0.9)))
	if totalDamage > self.health:
		self.health = 0
	else:
		self.health -= totalDamage


func isAlive() -> bool: return self.health > 0



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
