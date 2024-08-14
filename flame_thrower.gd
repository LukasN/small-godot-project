extends Area2D

const DAMAGE = 5

var flame_active = false

func _physics_process(_delta):
	var enemies_in_range = get_overlapping_bodies()
	
	if enemies_in_range.size() != 0:
		var target = enemies_in_range.front()
		look_at(target.global_position)
		
		

func shoot_flames():
	flame_active = true
	%flames_out.start()
	const FLAMES = preload("res://flames.tscn")
	var new_bullet = FLAMES.instantiate()
	new_bullet.damage = DAMAGE
	%flame_spawn.add_child(new_bullet)


func _on_timer_timeout():
	if not flame_active: 
		shoot_flames()


func _on_flames_out_timeout():
	flame_active = false
	%flames_out.stop()
