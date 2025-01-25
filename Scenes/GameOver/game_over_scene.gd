extends Control


func _ready() -> void:
	if Global.progress == Global.maxProgress:
		$VBoxContainer/ResultLabel.text = "YOU WIN"
	else:
		$VBoxContainer/ResultLabel.text = "YOU LOOSE"


func _on_restart_button_button_up() -> void:
	Global.reset()
	get_tree().change_scene_to_file("res://Scenes/Upgrade/UpgradeScene.tscn")
