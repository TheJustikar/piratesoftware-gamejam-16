class_name Upgrade extends GameObject


static var allUpgrades: Array = [
	CPUCore,
	DistributedNetwork,
	DockerContainer,
	DownloadButton,
	Encryption,
	FiberglassConnection,
	MoreServers,
	Overclocking,
	PhishingMail,
	RAMChip
]


var modifiers: Array[StatsModifier]


func _init(name: String, spritePath: String, modifiers: Array[StatsModifier]) -> void:
	self.modifiers = modifiers
	super(name, spritePath)


func doesModifyStat(stat: Stats.Type) -> int:
	var existingModifiers = modifiers.filter(func(modifier): return modifier.stat == stat)
	
	if existingModifiers.is_empty():
		return 0
	
	var modifier: StatsModifier = existingModifiers.front()
	
	if modifier.modifier == StatsModifier.Modifier.ADDITIVE:
		return sign(modifier.value)
	else:
		return 1 if modifier.value > 1 else -1


func getStatsString() -> String:
	if modifiers.is_empty():
		return "Nothing"
	
	var stats = ""
	for modifier in modifiers:
		stats += modifier.getModifierString() + "\n"
	return stats
