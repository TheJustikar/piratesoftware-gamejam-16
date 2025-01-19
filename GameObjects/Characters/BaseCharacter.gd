class_name Character

var health: int
#Damage prevention in percent
var defense: int
var damage: int
var hitRate: int

func _init(health: int, defense: int, damage: int, hitRate: int) -> void:
	self.health = health
	self.defense = defense
	self.damage = damage
	self.hitRate = hitRate

func shouldAttack(currentTime: int) -> bool: return (currentTime % self.hitRate) == 0

func takeDamage(damage: int): 
	var totalDamage = int(damage * (self.defense / 100))
	if totalDamage > self.health:
		self.health = 0
	else:
		self.health -= totalDamage

func isAlive() -> bool: return self.health > 0
