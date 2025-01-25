class_name Player extends Character


func _init(upgrades: Array[Upgrade], name: String, spritePath: String, stats: Stats) -> void:
	for upgrade in upgrades:
		stats.applyUpgrade(upgrade)
	
	super(name, spritePath, stats)


func getStatsStringWithUpgrade(upgrade: Upgrade) -> String:
	if upgrade == null:
		return super.getStatsString()
	
	var modifiedStats = stats.applyUpgrade(upgrade, true)
	
	var highlightColorString = Colors.hpColor.to_html()
	var richText = "[color=" + Colors.mainColor.to_html() + "]"
	if upgrade.doesModifyStat(Stats.Type.HEALTH):
		richText += "[color=" + highlightColorString + "]Health: %s[/color]\n" % modifiedStats.health
	else:
		richText += "Health: %s\n" % modifiedStats.health
	if upgrade.doesModifyStat(Stats.Type.DEFENSE):
		richText += "[color=" + highlightColorString + "]Defense: %s[/color]\n" % modifiedStats.defense
	else:
		richText += "Defense: %s\n" % modifiedStats.defense
	if upgrade.doesModifyStat(Stats.Type.DAMAGE):
		richText += "[color=" + highlightColorString + "]Damage: %s[/color]\n" % modifiedStats.damage
	else:
		richText += "Damage: %s\n" % modifiedStats.damage
	if upgrade.doesModifyStat(Stats.Type.HIT_RATE):
		richText += "[color=" + highlightColorString + "]Hit Rate: %s[/color]" % modifiedStats.hitRate
	else:
		richText += "Hit Rate: %s" % modifiedStats.hitRate
	richText += "[/color]"
	return richText
