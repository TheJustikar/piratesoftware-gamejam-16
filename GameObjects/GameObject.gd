class_name GameObject

var name: String
var spriteResource: Resource

func _init(name: String, spritePath: String) -> void:
	self.name = name
	self.spriteResource = load(spritePath)
