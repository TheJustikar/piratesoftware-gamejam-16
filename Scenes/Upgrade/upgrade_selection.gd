extends MarginContainer

signal did_toggle

var isSelected: bool = false

func _ready() -> void:
	$Background.color = Color.GRAY


func intializeWith(upgrade: Upgrade):
	if upgrade.spritePath.length() > 0:
		$MarginContainer/HBoxContainer/CenterContainer/TextureRect.texture = load(upgrade.spritePath)
	
	$MarginContainer/HBoxContainer/VBoxContainer/NameLabel.text = upgrade.name
	$MarginContainer/HBoxContainer/VBoxContainer/StatsLabel.text = upgrade.getStatsString()


func _on_mouse_entered() -> void:
	if isSelected == false:
		$Background.color = Color.LIGHT_GRAY
	

func _on_mouse_exited() -> void:
	if isSelected == false:
		$Background.color = Color.GRAY


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
		did_toggle.emit()
		isSelected = true
		$Background.color = Color.LIGHT_CORAL


func untoggle():
	isSelected = false
	$Background.color = Color.GRAY
