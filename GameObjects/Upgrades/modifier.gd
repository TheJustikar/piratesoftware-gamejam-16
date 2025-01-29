class_name StatsModifier


enum Modifier {ADDITIVE, MULTIPLICATIVE}


var stat: Stats.Type
var modifier: Modifier
var value: float


func _init(stat: Stats.Type, modifier: Modifier, value: float) -> void:
	self.modifier = modifier
	self.stat = stat
	self.value = value


func getModifierString() -> String:
	var result = ""
	match modifier:
		Modifier.ADDITIVE:
			if value >= 0:
				result += "+%s" % int(value)
			else:
				result += str(int(value))
		Modifier.MULTIPLICATIVE:
			result += "x" + str(value).pad_decimals(1)
	
	return result + " " + Stats.getStatName(stat)


func applyToValue(base: float) -> float:
	if modifier == Modifier.ADDITIVE:
		return base + int(value)
	else:
		return base * value
