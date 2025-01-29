class_name EvilEye extends Player

func _init(upgrades: Array[Upgrade] = []) -> void:
	super(
		upgrades,
		"EvilEye",
		"res://GameObjects/Characters/Player/evil_eye_animation.tres",
		Stats.new(100, 0, 10, 10))
