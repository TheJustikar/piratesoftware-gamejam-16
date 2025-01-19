class_name Upgrade

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
