class_name Firewall extends Enemy

func _init() -> void:
	super(
		"Firewall", 
		"res://GameObjects/Characters/Enemies/firewall.tres", 
		Stats.new(100, 0, 10, 15))
