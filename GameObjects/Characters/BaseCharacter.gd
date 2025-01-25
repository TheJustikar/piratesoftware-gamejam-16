class_name Character extends GameObject


var stats: Stats


func _init(name: String, spritePath: String, stats: Stats) -> void:
	self.stats = stats
	super(name, spritePath)


func shouldAttack(currentTime: int) -> bool: 
	return currentTime != 0 && timeToAttack(currentTime) == 0


func timeToAttack(currentTime: int) -> int: return currentTime % stats.hitRate


func takeDamage(damage: int): 
	var totalDamage = int(damage * (1 - clamp(stats.defense / 100.0, -0.9, 0.9)))
	if totalDamage > stats.health:
		stats.health = 0
	else:
		stats.health -= totalDamage


func isAlive() -> bool: return stats.health > 0


func getStatsString() -> String: return stats.getStatsString()
