extends Area2D

var isCleaning = false
var speed = 100
onready var animatedSprite = $"AnimatedSprite"

func _ready():
	animatedSprite.play("Idle")
	
func _process(delta):
	if Input.is_action_just_pressed("use_tool"):
		isCleaning = true
		
	if isCleaning:
		animatedSprite.play("Clean")
		
	if !animatedSprite.is_playing():
		animatedSprite.play("Idle")

func _physics_process(delta):
	
	if isCleaning:
		return
		
	var motion = Vector2();

	if Input.is_action_pressed("move_left"):
		motion.x += -1
		animatedSprite.flip_h = true
	if Input.is_action_pressed("move_right"):
		motion.x += 1
		animatedSprite.flip_h = false
	if Input.is_action_pressed("move_up"):
		motion.y = -1
	if Input.is_action_pressed("move_down"):
		motion.y = +1

	$".".position += motion * delta * speed
	
	if motion.x != 0 or motion.y != 0:
		animatedSprite.play("Walk")
	else:
		animatedSprite.play("Idle")



func _on_AnimatedSprite_frame_changed():
	if animatedSprite.frame == 6:
		isCleaning = false
		animatedSprite.stop()
