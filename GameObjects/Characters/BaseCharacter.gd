class_name Character

var health: int
#Damage prevention in percent
var defense: int
var damage: int
var hitRate: int

func shouldAttack(currentTime: int) -> bool: return (currentTime % hitRate) == 0

func takeDamage(damage: int): health -= int(damage * (defense / 100))

func isAlive() -> bool: return health > 0
