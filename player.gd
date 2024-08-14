extends CharacterBody2D

var player_health = 100.0

var current_item = null

signal player_died



signal camera_moved

func has_item():
	return current_item != null
	
func set_item(item):
	if has_item() == true:
		current_item.queue_free()
	current_item=item
	add_child(item)
	

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down");
	
	velocity = direction * 600
	move_and_slide()
	
	
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %damageBox.get_overlapping_bodies()
	player_health -= DAMAGE_RATE * overlapping_mobs.size() * delta
	%healthBar.value = player_health
	if player_health <= 0.0:
		player_died.emit()
	

