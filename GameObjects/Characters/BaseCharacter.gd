class_name Character extends GameObject


var stats: Stats
var currentHealth: int


func _init(name: String, spritePath: String, stats: Stats) -> void:
	self.stats = stats
	resetCurrentHealth()
	super(name, spritePath)


func shouldAttack(currentTime: int) -> bool: 
	return currentTime != 0 && timeToAttack(currentTime) == 0


func timeToAttack(currentTime: int) -> int: return currentTime % stats.hitRate


func resetCurrentHealth():
	currentHealth = stats.health


func takeDamage(damage: int): 
	var totalDamage = int(damage * (1 - clamp(stats.defense / 100.0, -0.9, 0.9)))
	if totalDamage > currentHealth:
		currentHealth = 0
	else:
		currentHealth -= totalDamage


func isAlive() -> bool: return currentHealth > 0


func getStatsString() -> String: return stats.getStatsString()
