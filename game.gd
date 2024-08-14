extends Node2D

const MOB = preload("res://mob.tscn")
const TREE = preload("res://tree.tscn")
const ITEM_SPAWNER = preload("res://pickup_gun.tscn")

func spawn_mob():
	var mob_instance = MOB.instantiate()
	mob_instance.global_position = %PathFollow2D.global_position
	add_child(mob_instance)
	%PathFollow2D.progress_ratio = randf()
	
func spawn_tree():
	var tree_instance = TREE.instantiate()
	tree_instance.global_position = %PathFollow2D.global_position
	add_child(tree_instance)
	%PathFollow2D.progress_ratio = randf()

	
func spawn_item():
	var item_instance = ITEM_SPAWNER.instantiate()
	item_instance.global_position = %PathFollow2D.global_position
	add_child(item_instance)
	%PathFollow2D.progress_ratio = randf()
	
func _ready():
	spawn_item()
	pass

func _on_timer_timeout():
	spawn_mob()
	pass


func _on_player_player_died():
	%GameOver.visible = true
	get_tree().paused = true
	get_tree().quit()




func _on_tree_spawner_timeout():
	spawn_tree()


func _on_item_spawner_timeout():
	spawn_item()
	pass # Replace with function body.
