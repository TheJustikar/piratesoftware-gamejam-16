class_name Stats


enum Type {HEALTH, DEFENSE, DAMAGE, HIT_RATE}


static func getStatName(type: Type) -> String:
	match type:
		Type.HEALTH:
			return "Health"
		Type.DEFENSE:
			return "Defense"
		Type.DAMAGE:
			return "Damage"
		Type.HIT_RATE:
			return "Hit Rate"
	
	return ""


var health: int
#Damage prevention in percent
var defense: int
var damage: int
var hitRate: int


func _init(health: int, defense: int, damage: int, hitRate: int) -> void:
	self.health = health
	self.defense = defense
	self.damage = damage
	self.hitRate = hitRate


func applyUpgrade(upgrade: Upgrade, applyToCopy: bool = false) -> Stats:
	var statsToModifiy: Stats
	if applyToCopy:
		statsToModifiy = Stats.new(health, defense, damage, hitRate)
	else:
		statsToModifiy = self
	
	for modifier in upgrade.modifiers:
		match modifier.stat:
			Type.HEALTH:
				statsToModifiy.health = modifier.applyToValue(health)
			Type.DEFENSE:
				statsToModifiy.defense = modifier.applyToValue(defense)
			Type.DAMAGE:
				statsToModifiy.damage = modifier.applyToValue(damage)
			Type.HIT_RATE:
				statsToModifiy.hitRate = modifier.applyToValue(hitRate)
		
		if statsToModifiy.health < 1:
			statsToModifiy.health = 1
		if statsToModifiy.damage < 0:
			statsToModifiy.damage = 0
		if statsToModifiy.hitRate < 1:
			statsToModifiy.hitRate = 1
	
	return statsToModifiy

func getStatsString() -> String:
	return "Health: %s\nDefense: %s\nDamage: %s\nHit Rate: %s" % [health, defense, damage, hitRate]
