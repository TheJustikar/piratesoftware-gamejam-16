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
