extends Control


var _enemy: Enemy = Global.currentEnemy()


var _currentTime: float = 0
var _lastPlayerHit: int = -1
var _lastEnemyHit: int = -1


func _ready() -> void:
	$Player.intializeWith(Global.player)
	$Enemy.intializeWith(_enemy)


func _process(delta: float) -> void:
	#TODO add timer before start
	_currentTime += delta * 5
	var timeStep = int(_currentTime)
	$Player.updateWithTime(timeStep)
	$Enemy.updateWithTime(timeStep)
	$TimeLabel.text = "Current time: %s" % timeStep
	if _lastPlayerHit != timeStep && Global.player.shouldAttack(timeStep):
		_enemy.takeDamage(Global.player.stats.damage)
		_lastPlayerHit = timeStep
		$Enemy.update(timeStep)
		
	if _enemy.isAlive():
		if _lastEnemyHit != timeStep && _enemy.shouldAttack(timeStep):
			Global.player.takeDamage(_enemy.stats.damage)
			_lastEnemyHit = timeStep
			$Player.update(timeStep)
			
	else:
		Global.progress += 1
		if Global.progress != Global.maxProgress:
			get_tree().change_scene_to_file("res://Scenes/Upgrade/UpgradeScene.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/GameOver/GameOverScene.tscn")
		Global.player.resetCurrentHealth()
		return
	
	if Global.player.isAlive() == false:
		get_tree().change_scene_to_file("res://Scenes/GameOver/GameOverScene.tscn")
		return
