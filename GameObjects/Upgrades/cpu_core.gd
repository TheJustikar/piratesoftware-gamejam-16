class_name CPUCore extends Upgrade


func _init() -> void:
	super(
		"CPU Core",
		"res://GameObjects/Upgrades/cpu_core.png",
		[
			StatsModifier.new(
			Stats.Type.HIT_RATE,
			StatsModifier.Modifier.MULTIPLICATIVE,
			0.85),
		])
