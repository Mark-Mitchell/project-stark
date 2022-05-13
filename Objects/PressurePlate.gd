extends Area2D

var triggered = false

func _ready():
	pass



func _on_PressurePlate_body_entered(body):
	if body.name == "SkeletalPlayer":
		$Plate.modulate = Color(1,0,1,1)
		AL.pressureplate_pressed = true


func _on_PressurePlate_body_exited(body):
	if body.name == "SkeletalPlayer":
		$Plate.modulate = Color(1,1,1,1)
		AL.pressureplate_pressed = false
