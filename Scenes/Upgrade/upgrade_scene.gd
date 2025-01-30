extends Control


@onready
var _upgrades: Array[Upgrade] = []
@onready
var _currentSelection: int = -1


func _ready() -> void:
	$Character.intializeWith(Global.player)
	$ScoreLabel.text = "Score: %s" % Global.progress
	
	var pickedUpgrades = []
	
	while pickedUpgrades.size() != 3:
		var upgrade = Upgrade.allUpgrades.pick_random()
		if pickedUpgrades.has(upgrade) == false:
			pickedUpgrades.append(upgrade)
	
	for i in range(3):
		var upgrade = pickedUpgrades[i].new()
		_upgrades.append(upgrade)
		get_node(NodePath("Upgrades/UpgradeSelection%s"% (i + 1))).intializeWith(upgrade)


func _on_confirm_button_button_up() -> void:
	var selectedUpgrade: Upgrade = _upgrades[_currentSelection]
	Global.player.stats.applyUpgrade(selectedUpgrade)
	Global.player.resetCurrentHealth()
	get_tree().change_scene_to_file("res://Scenes/Battle/BattleScene.tscn")


func _on_select_upgrade_1_button_toggled() -> void:
	$Upgrades/CenterContainer/ConfirmButton.disabled = false
	_currentSelection = 0
	$Character.previewUpgrade(_upgrades[0])


func _on_select_upgrade_2_button_toggled() -> void:
	$Upgrades/CenterContainer/ConfirmButton.disabled = false
	_currentSelection = 1
	$Character.previewUpgrade(_upgrades[1])


func _on_select_upgrade_3_button_toggled() -> void:
	$Upgrades/CenterContainer/ConfirmButton.disabled = false
	_currentSelection = 2
	$Character.previewUpgrade(_upgrades[2])
