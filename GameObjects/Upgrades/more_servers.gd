class_name MoreServers extends Upgrade


func _init() -> void:
	super(
		"More Servers",
		"res://GameObjects/Upgrades/more_servers.png",
		[
			StatsModifier.new(
			Stats.Type.HEALTH,
			StatsModifier.Modifier.ADDITIVE,
			35),
			StatsModifier.new(
			Stats.Type.HIT_RATE,
			StatsModifier.Modifier.MULTIPLICATIVE,
			1.1),
		])
