extends Area2D

var speed = 1200

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta



func _on_Timer_timeout():
	get_node("Sprite").visible = false
	get_node("CollisionShape2D").disabled = true




func _on_Bullet_area_shape_entered(area_id, area, area_shape, local_shape):
	queue_free()
