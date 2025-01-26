class_name AntiBrella extends Enemy

func _init() -> void:
	super(
		"Anti-brella", 
		"res://GameObjects/Characters/Enemies/anti-brella.tres", 
		Stats.new(140, 10, 5, 20))
