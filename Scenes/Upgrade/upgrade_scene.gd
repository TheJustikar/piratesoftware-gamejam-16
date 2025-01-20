extends Control


@onready
var upgrades: Array[Upgrade] = []
var currentSelection: int = -1


func _ready() -> void:
	$MarginContainer/CenterContainer/HSplitContainer/Character/CharacterStatsLabel.text = "Character:\n%s" % Global.player().getStatsString()
	
	var pickedUpgrades = []
	
	while pickedUpgrades.size() != 3:
		var upgrade = Upgrade.allUpgrades.pick_random()
		if pickedUpgrades.has(upgrade) == false:
			pickedUpgrades.append(upgrade)
	
	for i in range(3):
		var upgrade = pickedUpgrades[i].new()
		upgrades.append(upgrade)
		get_node(NodePath("MarginContainer/CenterContainer/HSplitContainer/Upgrades/UpgradeSelection%s" % (i + 1))).intializeWith(upgrade)


func _on_confirm_button_button_up() -> void:
	Global.upgrades.append(upgrades[currentSelection])
	get_tree().change_scene_to_file("res://Scenes/Battle/BattleScene.tscn")


func _on_select_upgrade_1_button_toggled() -> void:
	$MarginContainer/CenterContainer/HSplitContainer/Upgrades/CenterContainer/ConfirmButton.disabled = false
	currentSelection = 0
	$MarginContainer/CenterContainer/HSplitContainer/Upgrades/UpgradeSelection2.untoggle()
	$MarginContainer/CenterContainer/HSplitContainer/Upgrades/UpgradeSelection3.untoggle()


func _on_select_upgrade_2_button_toggled() -> void:
	$MarginContainer/CenterContainer/HSplitContainer/Upgrades/CenterContainer/ConfirmButton.disabled = false
	currentSelection = 1
	$MarginContainer/CenterContainer/HSplitContainer/Upgrades/UpgradeSelection1.untoggle()
	$MarginContainer/CenterContainer/HSplitContainer/Upgrades/UpgradeSelection3.untoggle()


func _on_select_upgrade_3_button_toggled() -> void:
	$MarginContainer/CenterContainer/HSplitContainer/Upgrades/CenterContainer/ConfirmButton.disabled = false
	currentSelection = 2
	$MarginContainer/CenterContainer/HSplitContainer/Upgrades/UpgradeSelection1.untoggle()
	$MarginContainer/CenterContainer/HSplitContainer/Upgrades/UpgradeSelection2.untoggle()
