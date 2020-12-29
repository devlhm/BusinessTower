extends CanvasLayer

onready var audioPlayer = $AudioPlayer
var rng = RandomNumberGenerator.new()

var groundCleansedSFX
var bagEmptiedSFX

func _ready():
	rng.randomize()	
	groundCleansedSFX = load("res://Audio/Sounds/done.ogg")
	groundCleansedSFX.set_loop(false)
	
	bagEmptiedSFX = load("res://Audio/Sounds/lixo.ogg")
	bagEmptiedSFX.set_loop(false)

func playSoundTrashCleansed():
	audioPlayer.set_stream(groundCleansedSFX)
	var randomPitch = rng.randf_range(0.95, 1.05)
	audioPlayer.set_pitch_scale(randomPitch)
	audioPlayer.play()

func playSoundBagEmptied():
	audioPlayer.set_stream(bagEmptiedSFX)
	audioPlayer.play()
