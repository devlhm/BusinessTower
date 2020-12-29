extends Control

onready var timeBar = $CenterContainer/TimeBar/ProgressBar
onready var trashCountBar = $CenterContainer2/VBoxContainer/ProgressBar
onready var tween = $CenterContainer/TimeBar/Tween
onready var trashAtBagCounter = $HBoxContainer/Label
onready var trashCount = get_tree().get_nodes_in_group("trash").size()
onready var animatedTrashCount = trashCount
var trashAtBagCount = 0
var trashAtBagLimit = 3

var time = 0
var timeUntilCheck = 5
func _ready():
	tween.connect("tween_completed", self, "_on_tween_completed")
	
	tween.interpolate_property(self, "time", time, time + timeUntilCheck, 5)
	tween.start()

	trashAtBagCounter.set_text(str(trashAtBagCount) + "/" + str(trashAtBagLimit))
	
func _process(delta):
	var newTrashCount = get_tree().get_nodes_in_group("trash").size()
		
	timeBar.value = time
	trashCountBar.value = animatedTrashCount

func _on_tween_completed(object, key):
	if key != ":time":
		return
	if time == 90:
		return
		
	#adicionar aqui código para o chefe vir checar o trabalho do jogador,
	#antes de retomar a contagem
		
	tween.interpolate_property(self, "time", time, time + timeUntilCheck, 30)
	tween.start()
	
func _on_trash_cleansed():
	trashCount -= 1
	trashAtBagCount += 1
	
	tween.interpolate_property(self, "animatedTrashCount", animatedTrashCount, trashCount, 0.3)
	tween.start()	
	
	trashAtBagCounter.set_text(str(trashAtBagCount) + "/" + str(trashAtBagLimit))
	
func _trash_at_bag_count_reset():
	trashAtBagCount = 0
	trashAtBagCounter.set_text(str(trashAtBagCount) + "/" + str(trashAtBagLimit))
