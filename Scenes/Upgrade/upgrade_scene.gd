extends Control


@onready
var upgrades: Array[Upgrade] = []

func _ready() -> void:
	var pickedUpgrades = []
	
	while pickedUpgrades.size() != 3:
		var upgrade = Upgrade.allUpgrades.pick_random()
		if pickedUpgrades.has(upgrade) == false:
			pickedUpgrades.append(upgrade)
	
	for i in range(3):
		var upgrade = pickedUpgrades[i].new()
		upgrades.append(upgrade)


func _on_confirm_button_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/Battle/BattleScene.tscn")
