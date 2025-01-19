class_name Character

var health
var defense
var damage
var hitRate

func shouldAttack(currentTime) -> bool: return (currentTime % hitRate) == 0
