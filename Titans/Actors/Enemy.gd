extends KinematicBody2D

const speed = 100.0
var Bullet = preload("res://Weapons/Enemy Bullet.tscn")
var fire_rate = 1.0 # Fire rate 8 bullets per second
onready var update_delta = 8.0 / fire_rate
var current_time : = 0.0
var health = 300.0
onready var player = get_node("/root/Level1/Player")
var velocity = Vector2(0,0)
var gravity = 1500.0

func _physics_process(delta):
	if player:
		var direction = (player.position - position).normalized()
		if not is_on_floor():
				direction.y += gravity
		move_and_slide(direction * speed) 
		
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			# if collision.collider.name == "Player":
			var object = collision.collider
			if object.is_in_group("characters"):
				object.HEALTH = object.HEALTH - 30
				if object.HEALTH <= 0:
					object.die()
					
	
func _on_HitBox_area_entered(area):
	health = health - 27.3
	if health <= 0:
		queue_free()

func _process(delta: float) -> void:
	current_time += delta
	if (current_time < update_delta):
		return
		
func attack():
	pass
