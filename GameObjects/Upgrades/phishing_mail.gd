class_name PhishingMail extends Upgrade


func _init() -> void:
	super(
		"Phishing Mail",
		"res://GameObjects/Upgrades/phising_mail.png",
		[
			StatsModifier.new(
			Stats.Type.HEALTH, 
			StatsModifier.Modifier.ADDITIVE, 
			-30),
			StatsModifier.new(
			Stats.Type.DAMAGE, 
			StatsModifier.Modifier.ADDITIVE, 
			15),
		])
