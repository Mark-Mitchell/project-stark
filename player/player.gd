class_name Player
extends KinematicBody2D

var speed = Vector2(200.0, 200.0)
var velocity = Vector2.ZERO

onready var sprite = $Character
onready var sprite_scale = sprite.scale.x
onready var sprite_scaleY = sprite.scale.y

# variables for dashing
var dashing = false
const dash_time = 0.2
var curr_dash_time = 0
var dashing_velocity_x = 0
var dashing_velocity_y = 0

func _physics_process(_delta):
	AL.playerpos = global_position
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if (dashing):
		velocity.x = dashing_velocity_x
		velocity.y = dashing_velocity_y
	else:
		velocity.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * speed.x
		velocity.y = (Input.get_action_strength("move_down") - Input.get_action_strength("move_up")) * speed.y

	if (dashing):
		curr_dash_time += _delta
		# reset everything after dash time is reached
		if curr_dash_time >= dash_time:
			dashing = false
			velocity.x = 0
			velocity.y = 0
			curr_dash_time = 0
			$AnimationPlayer.play("float")
		return
	else:
		if Input.is_action_just_pressed("dash"):
			dashing = true
			dashing_velocity_x = velocity.x * 3
			dashing_velocity_y = velocity.y * 3
			
			# only animate the dash when the character was moving
			if (dashing_velocity_x > 0) or (dashing_velocity_y > 0):
				$AnimationPlayer.play("dashing")
			return
			
			# moving controls
		if Input.is_action_pressed("move_left"):
			velocity.x *= 0.5
		if Input.is_action_pressed("move_right"):
			velocity.x *= 0.5
		if Input.is_action_pressed("move_up"):
			velocity.y *= 0.5
		if Input.is_action_pressed("move_down"):
			velocity.y *= 0.5

	if (abs(velocity.x) > 50) or (abs(velocity.y) > 50):
		$AnimationPlayer.play("flying")
	else:
		$AnimationPlayer.play("float")

	# Calculate flipping and falling speed for animation purposes.
	if velocity.x > 0:
		sprite.transform.x = Vector2(sprite_scale, 0)
	elif velocity.x < 0:
		sprite.transform.x = Vector2(-sprite_scale, 0)

#Check if player is in range to get to the next level
func _on_CheckForDoor_body_entered(body):
	if body.is_in_group("exit"):
		AL.teleport_available = true
func _on_CheckForDoor_body_exited(body):
	if body.is_in_group("exit"):
		AL.teleport_available = false

#Check if player is in range to activate pressureplate
func _on_CheckForDoor_area_entered(area):
	var groups = area.get_groups()
	for x in groups:
		if x == "pressureplate":
			area.set_process(true)
			break
func _on_CheckForDoor_area_exited(area):
	var groups = area.get_groups()
	for x in groups:
		if x == "pressureplate":
			area.set_process(false)
			break
