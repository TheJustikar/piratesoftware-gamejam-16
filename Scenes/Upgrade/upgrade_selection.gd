extends MarginContainer

@export
var buttonGroup: ButtonGroup

signal did_toggle

var isSelected: bool = false

func _ready() -> void:
	$Button.button_group = buttonGroup

func intializeWith(upgrade: Upgrade):
	if upgrade.spritePath.length() > 0:
		$MarginContainer/HBoxContainer/IconContainer/TextureRect.texture = load(upgrade.spritePath)
	
	$MarginContainer/HBoxContainer/LabelContainer/NameLabel.text = upgrade.name
	$MarginContainer/HBoxContainer/LabelContainer/StatsLabel.text = upgrade.getStatsString()

func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		did_toggle.emit()
