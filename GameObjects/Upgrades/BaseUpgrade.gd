class_name Upgrade extends GameObject


var health: int
#Damage prevention in percent
var defense: int
var damage: int
var hitRate: int


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


func _init(name: String, spritePath: String, health: int, defense: int, damage: int, hitRate: int) -> void:
	self.health = health
	self.defense = defense
	self.damage = damage
	self.hitRate = hitRate
	super(name, spritePath)


func getStatsString() -> String:
	var stats = ""
	if health != 0:
		stats += "Health: %s" % _checkNegatives(health)
	if defense != 0:
		if stats.is_empty() == false:
			stats += "\n"
		stats += "Defense: %s" % _checkNegatives(defense)
	if damage != 0:
		if stats.is_empty() == false:
			stats += "\n"
		stats += "Damage: %s" % _checkNegatives(damage)
	if hitRate != 0:
		if stats.is_empty() == false:
			stats += "\n"
		stats += "Hit Rate: %s" % _checkNegatives(hitRate)
	
	if stats.is_empty():
		stats = "Nothing"
	return stats


func _checkNegatives(value: int) -> String:
	if value < 0:
		return "%s" % value
	else:
		return "+%s" % value
