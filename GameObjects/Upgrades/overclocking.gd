class_name Overclocking extends Upgrade


func _init() -> void:
	super(
		"Overclocking",
		"res://GameObjects/Upgrades/overclocking.png",
		[
			StatsModifier.new(
			Stats.Type.HEALTH, 
			StatsModifier.Modifier.ADDITIVE, 
			-20),
			StatsModifier.new(
			Stats.Type.DEFENSE, 
			StatsModifier.Modifier.ADDITIVE, 
			-10),
			StatsModifier.new(
			Stats.Type.DAMAGE, 
			StatsModifier.Modifier.ADDITIVE, 
			10),
			StatsModifier.new(
			Stats.Type.HIT_RATE, 
			StatsModifier.Modifier.MULTIPLICATIVE, 
			0.85),
		])
