extends CollisionShape

func _on_Area2D_body_entered(body):
	if body.isCleaning:
		queue_free()
