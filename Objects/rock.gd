extends KinematicBody2D

var in_area = false

func _on_Area2D_area_entered(area):
	if area.name == "CheckForRock":
		in_area = true

func _on_Area2D_area_exited(area):
	if area.name == "CheckForRock":
		in_area = false
		
func _physics_process(_delta):
	if Input.is_action_just_pressed("use_item"):
		if in_area:
			AL.stone_count += 1
			var stone = get_tree().get_nodes_in_group("stone_counter")
			stone[0].text = String(AL.stone_count)
			queue_free()
