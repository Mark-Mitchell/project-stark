extends Sprite

func _process(delta):
	if AL.disspawn_key:
		AL.disspawn_key = false
		AL.keycount += 1
		queue_free()

func _on_Collectable_area_entered(area):
	if area.name == "CheckForDoor":
		AL.keypickup = true


func _on_Collectable_area_exited(area):
	if area.is_in_group("player"):
		AL.keypickup = false
