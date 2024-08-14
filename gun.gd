extends Area2D

const DAMAGE = 5

func _physics_process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() != 0:
		var target = enemies_in_range.front()
		look_at(target.global_position)
		
		

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.damage = DAMAGE
	new_bullet.global_position = %shootingpoint.global_position
	new_bullet.global_rotation = %shootingpoint.global_rotation
	%shootingpoint.add_child(new_bullet)


func _on_timer_timeout():
	shoot()



