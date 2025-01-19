class_name Player extends Character

func _init(upgrades: Array[Upgrade], health: int, defense: int, damage: int, hitRate: int) -> void:
	var actualHealth = health
	var actualDefense = defense
	var actualDamage = damage
	var actualHitRate = hitRate
	for upgrage in upgrades:
		actualHealth += upgrage.health
		actualDefense += upgrage.defense
		actualDamage += upgrage.damage
		actualHitRate += upgrage.hitRate
	super(actualHealth, actualDefense, actualDamage, actualHitRate)
