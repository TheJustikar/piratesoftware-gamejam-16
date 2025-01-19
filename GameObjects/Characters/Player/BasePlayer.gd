class_name Player extends Character

func _init(upgrades: Array[Upgrade], health: int, defense: int, damage: int, hitRate: int) -> void:
	var actualHealth = health
	var actualDefense = defense
	var actualDamage = damage
	var actualHitRate = hitRate
	for upgrade in upgrades:
		actualHealth += upgrade.health
		actualDefense += upgrade.defense
		actualDamage += upgrade.damage
		actualHitRate += upgrade.hitRate
	super(actualHealth, actualDefense, actualDamage, actualHitRate)
