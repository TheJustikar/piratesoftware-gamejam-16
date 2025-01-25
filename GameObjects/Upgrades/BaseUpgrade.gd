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


func doesModifyStat(stat: Stats.Type) -> bool:
	return modifiers.filter(
		func(modifier): return modifier.stat == stat
		).size() > 0


func getStatsString() -> String:
	if modifiers.is_empty():
		return "Nothing"
	
	var stats = ""
	for modifier in modifiers:
		stats += modifier.getModifierString() + "\n"
	return stats
