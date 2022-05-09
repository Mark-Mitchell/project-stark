class_name Player
extends KinematicBody2D

var speed = Vector2(200.0, 200.0)
var velocity = Vector2.ZERO

onready var sprite = $Sprite
onready var sprite_scale = sprite.scale.x
onready var sprite_scaleY = sprite.scale.y

func _ready():
	$AnimationTree.active = true

func _physics_process(_delta):
	AL.playerpos = global_position
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * speed.x
	velocity.y = (Input.get_action_strength("move_down") - Input.get_action_strength("move_up")) * speed.y

	if Input.is_action_pressed("move_left"):
		velocity.x *= 0.3
	if Input.is_action_pressed("move_right"):
		velocity.x *= 0.3
	if Input.is_action_pressed("move_up"):
		velocity.y *= 0.3
	if Input.is_action_pressed("move_down"):
		velocity.y *= 0.3
	
	if Input.is_action_just_pressed("ui_accept"):
		if AL.keypickup:
			$Inventory/Inventory/KeyCounter/Label.text = String(1)
			AL.disspawn_key = true
		
	if (abs(velocity.x) > 50) or (abs(velocity.y) > 50):
		$AnimationPlayer.play("run")
	else:
		$AnimationPlayer.play("idle")

	# Calculate flipping and falling speed for animation purposes.
	if velocity.x > 0:
		sprite.transform.x = Vector2(sprite_scale, 0)
	elif velocity.x < 0:
		sprite.transform.x = Vector2(-sprite_scale, 0)
	


func _on_CheckForDoor_body_entered(body):
	if body.is_in_group("exit"):
		AL.teleport_available = true


func _on_CheckForDoor_body_exited(body):
	if body.is_in_group("exit"):
		AL.teleport_available = false
