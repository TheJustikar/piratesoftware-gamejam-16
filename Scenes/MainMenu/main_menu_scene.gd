extends Control


func _on_start_button_button_up() -> void:
	Global.reset()
	get_tree().change_scene_to_file("res://Scenes/Upgrade/UpgradeScene.tscn")
