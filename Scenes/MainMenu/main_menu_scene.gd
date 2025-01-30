extends Control


func _ready() -> void:
	$Character.intializeWith(EvilEye.new())
	if OS.has_feature("web"):
		$ButtonsContainer/VBoxContainer/QuitButton.disabled = true
		$ButtonsContainer/VBoxContainer/QuitButton.hide()


func _on_start_button_button_up() -> void:
	Global.reset()
	get_tree().change_scene_to_file("res://Scenes/Upgrade/UpgradeScene.tscn")


func _on_credits_button_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/Credits/CreditsScene.tscn")


func _on_quit_button_button_up() -> void:
	get_tree().quit()
