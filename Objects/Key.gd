extends Sprite

var keypickup = false

func _process(_delta):
	if Input.is_action_just_pressed("use_item"):
		if keypickup:
			AL.add_keys(1)
			queue_free()

func _on_Collectable_area_entered(area):
	if area.name == "CheckForDoor":
		keypickup = true


func _on_Collectable_area_exited(area):
	if area.name == "CheckForDoor":
		keypickup = false
