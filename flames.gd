extends Area2D

var damage = 2


func _ready():
	%animation.play("default")
	pass
	
	
func _physics_process(delta):
	var overlapping_mobs = get_overlapping_bodies()
	for  mob in overlapping_mobs:
		if mob.has_method("take_damage"):
			mob.take_damage(damage *delta)


func _on_timer_timeout():
	%animation.stop()
	queue_free()
