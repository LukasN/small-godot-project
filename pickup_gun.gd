extends Area2D

@onready var player = get_node("/root/Game/player")

const MACHINE_GUN = preload("res://machine_gun.tscn")
const GUN = preload("res://gun.tscn")
const FLAME_TROWER = preload("res://flame_thrower.tscn")

func choose_item():
	var item = randf() * 100
	if item < 45.0:
		return GUN.instantiate()
	elif item < 90.0:
		return MACHINE_GUN.instantiate()
	else:
		return FLAME_TROWER.instantiate()
	

func pick_up_item():
	var new_item = choose_item()
	player.set_item(new_item)


func _on_body_entered(body):
	queue_free()
	pick_up_item()
	
	
