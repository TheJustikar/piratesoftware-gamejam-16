class_name TrojanHorse extends Enemy

func _init(level: int = 0) -> void:
	super(
		"Trojan Horse", 
		"res://GameObjects/Characters/Enemies/trojan_horse.tres", 
		Stats.new(
			Enemy.calculateMultiplyer(70 , level, 0.2), 
			Enemy.calculateMultiplyer(50 , level, 0.05), 
			15, 
			15))
