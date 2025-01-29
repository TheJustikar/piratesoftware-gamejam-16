class_name DockerContainer extends Upgrade


func _init() -> void:
	super(
		"Docker Container",
		"res://GameObjects/Upgrades/docker_container.png",
		[
			StatsModifier.new(
			Stats.Type.HEALTH,
			StatsModifier.Modifier.ADDITIVE,
			10),
			StatsModifier.new(
			Stats.Type.DEFENSE,
			StatsModifier.Modifier.ADDITIVE,
			10),
			StatsModifier.new(
			Stats.Type.DAMAGE,
			StatsModifier.Modifier.ADDITIVE,
			10),
			StatsModifier.new(
			Stats.Type.HIT_RATE,
			StatsModifier.Modifier.MULTIPLICATIVE,
			1.1),
		])
