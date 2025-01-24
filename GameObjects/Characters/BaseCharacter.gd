class_name Character extends GameObject


var health: int
#Damage prevention in percent
var defense: int
var damage: int
var hitRate: int


func _init(name: String, spritePath: String, health: int, defense: int, damage: int, hitRate: int) -> void:
	self.health = health
	self.defense = defense
	self.damage = damage
	self.hitRate = hitRate
	super(name, spritePath)


func shouldAttack(currentTime: int) -> bool: 
	return currentTime != 0 && timeToAttack(currentTime) == 0


func timeToAttack(currentTime: int) -> int: return currentTime % self.hitRate


func takeDamage(damage: int): 
	var totalDamage = int(damage * (1 - clamp(self.defense / 100.0, -0.9, 0.9)))
	if totalDamage > self.health:
		self.health = 0
	else:
		self.health -= totalDamage


func isAlive() -> bool: return self.health > 0


func getStatsString() -> String:
	return """Health: %s
	Defense: %s
	Damage: %s
	Hit Rate: %s""" % [health, defense, damage, hitRate]
