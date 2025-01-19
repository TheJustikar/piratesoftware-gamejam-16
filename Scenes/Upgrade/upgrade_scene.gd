extends Control


func _on_confirm_button_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/Battle/BattleScene.tscn")
