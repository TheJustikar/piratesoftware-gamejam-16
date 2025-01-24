@tool
class_name AnimatedTextureRect extends TextureRect

@export
var spriteFrames: SpriteFrames
@export
var currentAnimation: String = "default"
@export
var frameIndex: int = 0
@export
var speedScale: float = 1.0
@export
var autoplay: bool = false


var playing: bool = false
var _refreshRate: float = 1.0
var _fps: float = 30.0
var _frameDelta: float = 0


func _ready() -> void:
	_setAnimationData()
	if autoplay:
		play()


func  _process(delta: float) -> void:
	if spriteFrames == null || playing == false:
		playing = false
		return
	
	if spriteFrames.has_animation(currentAnimation) == false:
		playing = false
		assert(false, "Animation %s does not exist in SpriteFrames %s" % [currentAnimation, spriteFrames])
	
	_setAnimationData()
	_frameDelta += speedScale * delta
	if _frameDelta >= _refreshRate / _fps:
		texture = getNextFrame()
		_frameDelta = 0


func getNextFrame() -> Texture2D:
	frameIndex += 1
	if frameIndex >= spriteFrames.get_frame_count(currentAnimation):
		frameIndex = 0
		if spriteFrames.get_animation_loop(currentAnimation) == false:
			playing = false
	
	_setAnimationData()
	return spriteFrames.get_frame_texture(currentAnimation, frameIndex)


func play(animationName: String = currentAnimation):
	frameIndex = 0
	_frameDelta = 0.0
	currentAnimation = animationName
	_setAnimationData()
	playing = true


func _setAnimationData():
	if spriteFrames == null:
		return
	
	_fps = spriteFrames.get_animation_speed(currentAnimation)
	_refreshRate = spriteFrames.get_frame_duration(currentAnimation, frameIndex)


func resume():
	playing = true


func pause():
	playing = false


func stop():
	playing = false
	frameIndex = 0
