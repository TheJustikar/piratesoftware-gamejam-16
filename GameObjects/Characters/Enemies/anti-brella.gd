class_name AntiBrella extends Enemy

func _init(level: int = 0) -> void:
	super(
		"Anti-brella", 
		"res://GameObjects/Characters/Enemies/anti-brella.tres", 
		Stats.new(
			Enemy.calculateMultiplyer(150, level, 0.15),
			Enemy.calculateMultiplyer(20, level, 0.15),
			5, 
			20))
