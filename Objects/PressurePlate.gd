extends Area2D

var triggered = false
var has_stone = false

func _ready():
	set_process(false)

func _process(delta):
	if Input.is_action_just_pressed("use_item"):
		if has_stone:
			remove_stone()
		else:
			apply_stone()

func apply_stone():
	if AL.stone_count > 0:
		$Plate.modulate = Color(1,0,1,1)
		$Rock.visible = true
		var player = get_tree().get_nodes_in_group("player")[0]
		player.add_stone(-1)
		has_stone = true
		triggered = true
		AL.pressureplate_pressed = true

func remove_stone():
	$Plate.modulate = Color(1,1,1,1)
	$Rock.visible = false
	var player = get_tree().get_nodes_in_group("player")[0]
	player.add_stone(1)
	has_stone = false
	triggered = false
	AL.pressureplate_pressed = false

func _on_PressurePlate_body_entered(body):
	if body.name == "SkeletalPlayer" and not has_stone:
		$Plate.modulate = Color(1,0,1,1)
		AL.pressureplate_pressed = true


func _on_PressurePlate_body_exited(body):
	if body.name == "SkeletalPlayer" and not has_stone:
		$Plate.modulate = Color(1,1,1,1)
		AL.pressureplate_pressed = false
