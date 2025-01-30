extends Control


func _ready() -> void:
	$Character.intializeWith(Global.player)
	$VBoxContainer/ScoreLabel.text = "Final score: %s" % Global.progress
	if Global.progress == Global.maxProgress:
		$VBoxContainer/ResultLabel.text = "YOU WIN"
	else:
		$VBoxContainer/ResultLabel.text = "YOU LOOSE"
		
	if OS.has_feature("web"):
		$VBoxContainer/CenterContainer/VBoxContainer/QuitButton.disabled = true
		$VBoxContainer/CenterContainer/VBoxContainer/QuitButton.hide()


func _on_restart_button_button_up() -> void:
	Global.reset()
	get_tree().change_scene_to_file("res://Scenes/Upgrade/UpgradeScene.tscn")


func _on_main_menu_button_button_up() -> void:
	Global.reset()
	get_tree().change_scene_to_file("res://Scenes/MainMenu/MainMenuScene.tscn")


func _on_quit_button_button_up() -> void:
	get_tree().quit()
