extends Node2D

onready var player = get_node("/root/Level1/Player")

func _process(delta: float) -> void:
	look_at(player.position)
