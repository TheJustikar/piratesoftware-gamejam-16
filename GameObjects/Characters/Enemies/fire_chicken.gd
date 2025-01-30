class_name FireChicken extends Enemy

func _init(level: int = 0) -> void:
	var speed = 10
	if level > 8:
		speed = 6
	elif  level > 5:
		speed = 8
	super(
		"FireChicken", 
		"res://GameObjects/Characters/Enemies/fire_chicken.tres", 
		Stats.new(
			Enemy.calculateMultiplyer(90, level, 0.1), 
			0, 
			Enemy.calculateMultiplyer(20, level, 0.1), 
			speed))
