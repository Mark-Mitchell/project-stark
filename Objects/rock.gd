extends KinematicBody2D

var in_area = false
var has_rock = false


func _on_Area2D_area_entered(area):
	if area.name == "CheckForRock":
		in_area = true
#	print(area.name)

func _on_Area2D_area_exited(area):
	if area.name == "CheckForRock":
		in_area = false
		
func _physics_process(_delta):
	if Input.is_action_just_pressed("use_item"):
		if (in_area):
			has_rock = true
			queue_free()
		else:
			has_rock = false
