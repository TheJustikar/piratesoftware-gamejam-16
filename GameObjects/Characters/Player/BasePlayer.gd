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


func getStatsStringWithUpgrade(upgrade: Upgrade) -> String:
	if upgrade == null:
		return super.getStatsString()
	
	var highlightColorString = Colors.hpColor.to_html()
	var richText = "[color=" + Colors.mainColor.to_html() + "]"
	if upgrade.health != 0:
		richText += "[color=" + highlightColorString + "]Health: %s[/color]\n" % (health + upgrade.health)
	else:
		richText += "Health: %s\n" % health
	if upgrade.defense != 0:
		richText += "[color=" + highlightColorString + "]Defense: %s[/color]\n" % (defense + upgrade.defense)
	else:
		richText += "Defense: %s\n" % defense
	if upgrade.damage != 0:
		richText += "[color=" + highlightColorString + "]Damage: %s[/color]\n" % (damage + upgrade.damage)
	else:
		richText += "Damage: %s\n" % damage
	if upgrade.hitRate != 0:
		richText += "[color=" + highlightColorString + "]Hit Rate: %s[/color]" % (hitRate + upgrade.hitRate)
	else:
		richText += "Hit Rate: %s" % hitRate
	richText += "[/color]"
	return richText
