class_name FiberglassConnection extends Upgrade


func _init() -> void:
	super(
		"Fiberglass Connection",
		"res://GameObjects/Upgrades/fiberglass_connection.png",
		[
			StatsModifier.new(
			Stats.Type.DEFENSE, 
			StatsModifier.Modifier.ADDITIVE, 
			-20),
			StatsModifier.new(
			Stats.Type.HIT_RATE, 
			StatsModifier.Modifier.MULTIPLICATIVE, 
			0.75),
		])
