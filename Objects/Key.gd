extends Sprite

func _process(_delta):
	if AL.disspawn_key == true:
		AL.disspawn_key = false
		print("al.dispawnkey", AL.disspawn_key)
		AL.keycount += 1
		AL.keypickup = false
		queue_free()
	var dist = global_position.distance_to(AL.playerpos)
	if dist > 80:
		AL.keypickup = false
	

func _on_Collectable_area_entered(area):
	if area.name == "CheckForDoor":
		AL.keypickup = true


func _on_Collectable_area_exited(area):
	if area.is_in_group("player"):
		AL.keypickup = false
