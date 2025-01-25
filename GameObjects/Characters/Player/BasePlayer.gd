class_name Player extends Character


func _init(upgrades: Array[Upgrade], name: String, spritePath: String, health: int, defense: int, damage: int, hitRate: int) -> void:
	var actualHealth = health
	var actualDefense = defense
	var actualDamage = damage
	var actualHitRate = hitRate
	for upgrade in upgrades:
		actualHealth += upgrade.health
		actualDefense += upgrade.defense
		actualDamage += upgrade.damage
		actualHitRate += upgrade.hitRate
		if health < 1:
			health = 1
		if actualDamage < 0:
			actualDamage = 0
		if actualHitRate < 1:
			actualHitRate = 1
	super(name, spritePath, actualHealth, actualDefense, actualDamage, actualHitRate)
