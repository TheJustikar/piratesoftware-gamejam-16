extends Control


func _on_restart_button_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/Upgrade/UpgradeScene.tscn")
