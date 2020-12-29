extends Area2D

var inside
var GUI
func _ready():
	GUI = get_node("/root/MainScene/GUI")
	
func _process(delta):
	if inside:
		if Input.is_action_just_pressed("interact"):
			get_node("/root/MainScene").playSoundBagEmptied()
			GUI._trash_at_bag_count_reset()

func _on_Cart_area_entered(area):
	if area.is_in_group(Game.GROUP_PLAYER):	
		inside = true
	pass
