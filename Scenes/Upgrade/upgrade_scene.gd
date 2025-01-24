extends Control


@onready
var _upgrades: Array[Upgrade] = []
@onready
var _currentSelection: int = -1


func _ready() -> void:	
	$Character.intializeWith(Global.player())
	
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
	Global.upgrades.append(_upgrades[_currentSelection])
	get_tree().change_scene_to_file("res://Scenes/Battle/BattleScene.tscn")


func _on_select_upgrade_1_button_toggled() -> void:
	$Upgrades/CenterContainer/ConfirmButton.disabled = false
	_currentSelection = 0


func _on_select_upgrade_2_button_toggled() -> void:
	$Upgrades/CenterContainer/ConfirmButton.disabled = false
	_currentSelection = 1


func _on_select_upgrade_3_button_toggled() -> void:
	$Upgrades/CenterContainer/ConfirmButton.disabled = false
	_currentSelection = 2
