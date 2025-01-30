class_name Encryption extends Upgrade


func _init() -> void:
	super(
		"Encryption",
		"res://GameObjects/Upgrades/encryption.png",
		[
			StatsModifier.new(
			Stats.Type.DEFENSE,
			StatsModifier.Modifier.ADDITIVE,
			30),
		])
