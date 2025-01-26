class_name TrojanHorse extends Enemy

func _init() -> void:
	super(
		"Trojan Horse", 
		"res://GameObjects/Characters/Enemies/trojan_horse.tres", 
		Stats.new(50, 50, 15, 15))
