class_name FireChicken extends Enemy

func _init() -> void:
	super(
		"FireChicken", 
		"res://GameObjects/Characters/Enemies/fire_chicken.tres", 
		Stats.new(60, 0, 20, 10))
