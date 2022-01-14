extends KinematicBody2D

const speed = 200.0
var Bullet = preload("res://Weapons/Enemy Bullet.tscn")
var fire_rate = 2.0 #Fire rate 25 bullets per second
onready var update_delta = 1.0 / fire_rate
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
		
	
	
func _on_HitBox_area_entered(area):
	health = health - 27.2
	if health <= 0:
		queue_free()

func _process(delta: float) -> void:
	current_time += delta
	if (current_time < update_delta):
		return
		

func shoot():
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $"Enemy aim/Position2D".global_transform


