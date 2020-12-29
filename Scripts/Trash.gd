extends Area2D

var inside = false
var GUI
func _ready():
	GUI = get_node("/root/MainScene/GUI")
	
func _process(delta):
	if Input.is_action_pressed("use_tool"):
		if GUI.trashAtBagCount >= GUI.trashAtBagLimit:
			return
			
		if inside:
			get_parent().playSoundTrashCleansed()
			GUI._on_trash_cleansed()			
			queue_free()
		
func _on_Trash_area_entered(area):
	if area.is_in_group(Game.GROUP_PLAYER):	
		inside = true
	pass
