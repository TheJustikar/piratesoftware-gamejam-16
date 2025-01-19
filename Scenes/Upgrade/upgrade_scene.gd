extends Control


@onready
var upgrades: Array[Upgrade] = []

var currentSelection: int = -1


func _ready() -> void:
	$CharacterStatsLabel.text = "Character:\n%s" % Global.player().getStatsString()
	
	var pickedUpgrades = []
	
	while pickedUpgrades.size() != 3:
		var upgrade = Upgrade.allUpgrades.pick_random()
		if pickedUpgrades.has(upgrade) == false:
			pickedUpgrades.append(upgrade)
	
	for i in range(3):
		var upgrade = pickedUpgrades[i].new()
		upgrades.append(upgrade)
		get_node(NodePath("Upgrades/SelectUpgrade%sButton" % (i + 1))).text = upgrade.name
		get_node(NodePath("Upgrades/Upgrade%sStatsLabel" % (i + 1))).text = upgrade.getStatsString()


func _on_confirm_button_button_up() -> void:
	Global.upgrades.append(upgrades[currentSelection])
	get_tree().change_scene_to_file("res://Scenes/Battle/BattleScene.tscn")


func _on_select_upgrade_1_button_toggled(toggled_on: bool) -> void:
	$ConfirmButton.disabled = false
	if toggled_on:
		currentSelection = 0


func _on_select_upgrade_2_button_toggled(toggled_on: bool) -> void:
	$ConfirmButton.disabled = false
	if toggled_on:
		currentSelection = 1


func _on_select_upgrade_3_button_toggled(toggled_on: bool) -> void:
	$ConfirmButton.disabled = false
	if toggled_on:
		currentSelection = 2
