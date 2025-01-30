class_name Player extends Character


func _init(upgrades: Array[Upgrade], name: String, spritePath: String, stats: Stats) -> void:
	for upgrade in upgrades:
		stats.applyUpgrade(upgrade)
	
	super(name, spritePath, stats)


func getStatsStringWithUpgrade(upgrade: Upgrade) -> String:
	if upgrade == null:
		return super.getStatsString()
	
	var modifiedStats = stats.applyUpgrade(upgrade, true)
	
	var positiveColorString = Colors.hpColor.to_html()
	var negativeColorString = Colors.damageColor.to_html()
	var richText = "[color=" + Colors.mainColor.to_html() + "]"
	
	if upgrade.doesModifyStat(Stats.Type.HEALTH) > 0:
		richText += "[color=" + positiveColorString + "]Health: %s[/color]\n" % modifiedStats.health
	elif upgrade.doesModifyStat(Stats.Type.HEALTH) < 0:
		richText += "[color=" + negativeColorString + "]Health: %s[/color]\n" % modifiedStats.health
	else:
		richText += "Health: %s\n" % modifiedStats.health
	
	if upgrade.doesModifyStat(Stats.Type.DEFENSE) > 0:
		richText += "[color=" + positiveColorString + "]Defense: %s[/color]\n" % modifiedStats.defense
	elif upgrade.doesModifyStat(Stats.Type.DEFENSE) < 0:
		richText += "[color=" + negativeColorString + "]Defense: %s[/color]\n" % modifiedStats.defense
	else:
		richText += "Defense: %s\n" % modifiedStats.defense
	
	if upgrade.doesModifyStat(Stats.Type.DAMAGE) > 0:
		richText += "[color=" + positiveColorString + "]Damage: %s[/color]\n" % modifiedStats.damage
	elif upgrade.doesModifyStat(Stats.Type.DAMAGE) < 0:
		richText += "[color=" + negativeColorString + "]Damage: %s[/color]\n" % modifiedStats.damage
	else:
		richText += "Damage: %s\n" % modifiedStats.damage
	
	if upgrade.doesModifyStat(Stats.Type.HIT_RATE) < 0:
		richText += "[color=" + positiveColorString + "]Hit Rate: %s[/color]" % modifiedStats.hitRate
	elif upgrade.doesModifyStat(Stats.Type.HIT_RATE) > 0:
		richText += "[color=" + negativeColorString + "]Hit Rate: %s[/color]" % modifiedStats.hitRate
	else:
		richText += "Hit Rate: %s" % modifiedStats.hitRate
	
	richText += "[/color]"
	return richText
