extends Area2D

var triggered = false
var has_stone = false
var mouse_here = false

func _ready():
	set_process(false)
	AL.pressureplates = len(get_tree().get_nodes_in_group("pressureplate"))

func _process(_delta):
	if Input.is_action_just_pressed("use_item"):
		if has_stone:
			remove_stone()
		else:
			apply_stone()

func apply_stone():
	if AL.stone_count > 0 and mouse_here:
		$Plate.modulate = Color(1,0,1,1)
		$Rock.visible = true
		AL.add_stones(-1)
		has_stone = true
		triggered = true
		AL.pressureplate_pressed += 1 

func remove_stone():
	if mouse_here:
		$Plate.modulate = Color(1,1,1,1)
		$Rock.visible = false
		AL.add_stones(1)
		has_stone = false
		triggered = false
		AL.pressureplate_pressed -= 1

func _on_PressurePlate_body_entered(body):
	if body.name == "SkeletalPlayer" and not has_stone:
		$Plate.modulate = Color(1,0,1,1)
		AL.pressureplate_pressed += 1


func _on_PressurePlate_body_exited(body):
	if body.name == "SkeletalPlayer" and not has_stone:
		$Plate.modulate = Color(1,1,1,1)
		AL.pressureplate_pressed -= 1


func _on_PressurePlate_mouse_entered():
	mouse_here = true


func _on_PressurePlate_mouse_exited():
	mouse_here = false
