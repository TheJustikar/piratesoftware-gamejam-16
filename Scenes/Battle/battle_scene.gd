extends Control


var _player: Player
var _enemy: Enemy


var _currentTime: float = 0
var _lastPlayerHit: int = -1
var _lastEnemyHit: int = -1


func _ready() -> void:
	_player = Global.player()
	_enemy = Global.currentEnemy()
	$Player.intializeWith(_player)
	$Enemy.intializeWith(_enemy)


func _process(delta: float) -> void:
	#TODO add timer before start
	_currentTime += delta * 5
	var timeStep = int(_currentTime)
	$Player.update(timeStep)
	$Enemy.update(timeStep)
	$TimeLabel.text = "Current time: %s" % timeStep
	if _lastPlayerHit != timeStep && _player.shouldAttack(timeStep):
		_enemy.takeDamage(_player.damage)
		_lastPlayerHit = timeStep
		$Enemy.update(timeStep)
		
	if _enemy.isAlive():
		if _lastEnemyHit != timeStep && _enemy.shouldAttack(timeStep):
			_player.takeDamage(_enemy.damage)
			_lastEnemyHit = timeStep
			$Player.update(timeStep)
			
	else:
		Global.progress += 1
		if Global.progress != Global.maxProgress:
			get_tree().change_scene_to_file("res://Scenes/Upgrade/UpgradeScene.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/GameOver/GameOverScene.tscn")
		return
	
	if _player.isAlive() == false:
		get_tree().change_scene_to_file("res://Scenes/GameOver/GameOverScene.tscn")
		return
