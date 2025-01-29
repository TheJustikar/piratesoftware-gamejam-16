class_name DistributedNetwork extends Upgrade


func _init() -> void:
	super(
		"Distributed Network",
		"res://GameObjects/Upgrades/distributed_network.png",
		[
			StatsModifier.new(
			Stats.Type.HEALTH, 
			StatsModifier.Modifier.ADDITIVE, 
			20),
			StatsModifier.new(
			Stats.Type.DEFENSE, 
			StatsModifier.Modifier.ADDITIVE, 
			20),
			StatsModifier.new(
			Stats.Type.DAMAGE, 
			StatsModifier.Modifier.ADDITIVE, 
			-10),
		])
