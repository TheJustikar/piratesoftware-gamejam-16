extends Node


const maxProgress: int = 10


var player: Player = EvilEye.new()
var progress: int = 0


var _enemiesFought: Array[Enemy] = []


func reset():
	progress = 0
	player = EvilEye.new()


func currentEnemy() -> Enemy:
	var newEnemy: Enemy
	var newEnemyId = randi_range(0, Enemy.allEnemies.size() - 1)
	
	#First enemy
	if _enemiesFought.is_empty():
		newEnemy = Enemy.allEnemies[newEnemyId].new()
		_enemiesFought.append(newEnemy)
	#Current enemy
	elif progress < _enemiesFought.size():
		newEnemy = _enemiesFought[progress]
	#Next Enemey
	else:
		if Enemy.allEnemies[newEnemyId] == _enemiesFought.back().get_script():
			newEnemyId += 1
			if newEnemyId >= Enemy.allEnemies.size():
				newEnemyId = 0
		newEnemy = Enemy.allEnemies[newEnemyId].new()
		_enemiesFought.append(newEnemy)
	
	return newEnemy
