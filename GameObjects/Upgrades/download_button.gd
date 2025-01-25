class_name DownloadButton extends Upgrade


func _init() -> void:
	super(
		"\"Download\" Button",
		"res://GameObjects/Upgrades/download_button.png",
		[
			StatsModifier.new(
			Stats.Type.DAMAGE,
			StatsModifier.Modifier.ADDITIVE,
			20),
		])
