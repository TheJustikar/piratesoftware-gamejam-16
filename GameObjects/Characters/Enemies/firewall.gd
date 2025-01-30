class_name Firewall extends Enemy

func _init(level: int = 0) -> void:
	super(
		"Firewall", 
		"res://GameObjects/Characters/Enemies/firewall.tres", 
		Stats.new(
			Enemy.calculateMultiplyer(120, level, 0.15), 
			0, 
			Enemy.calculateMultiplyer(10, level, 0.15), 
			15))
