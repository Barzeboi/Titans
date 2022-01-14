extends Actor


export var HEALTH : = 100 
var JUMPFORCE : = -900
var Bullet = preload("res://Weapons/Bullet.tscn")
var fire_rate = 9 #Fire rate 13 bullets per second
onready var update_delta = 1.0 / fire_rate
var current_time : float = 0.0

func _physics_process(delta):
	var direction = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed)
	_velocity = move_and_slide(_velocity, up_direction)

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0
	)
	
func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2
	) -> Vector2:
	var output: = linear_velocity
	output.x = speed.x * direction.x
	output.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		output.y = speed.y * direction.y
	return output
	
	
func _process(delta: float) -> void:
	current_time += delta
	if (current_time < update_delta):
		return
		
	if Input.is_action_pressed("shoot"):
		current_time = 0.0
		shoot()
		

func shoot():
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $Gun/aim.global_transform
