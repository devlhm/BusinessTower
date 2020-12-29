extends CollisionShape2D

func _on_Area2D_body_entered(body):
	print("coisou")
	if body.isCleaning:
		queue_free()
