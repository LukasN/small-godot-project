extends CharacterBody2D


var health = 3

@onready var player = get_node("/root/Game/player")

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.0
	move_and_slide()
	
func take_damage(damage):
	health -= damage
	%Slime.play_hurt()
	
	if health < 0:
		const SMOKE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var new_smoke_effect = SMOKE.instantiate()
		get_parent().add_child(new_smoke_effect)
		new_smoke_effect.global_position = %Slime.global_position
		queue_free()	
