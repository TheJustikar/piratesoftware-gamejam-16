class_name RAMChip extends Upgrade


func _init() -> void:
	super(
		"RAM Chip",
		"res://GameObjects/Upgrades/RAMChip.png",
		[
			StatsModifier.new(
			Stats.Type.HEALTH,
			StatsModifier.Modifier.ADDITIVE,
			30),
		])
