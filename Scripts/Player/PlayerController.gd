extends Area2D

var speed = 100

onready var animatedSprite = $"AnimatedSprite"

func _ready():
	animatedSprite.play("Idle")

func _physics_process(delta):
	
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
