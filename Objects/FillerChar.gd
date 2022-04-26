extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = Vector2(200,200)

func _physics_process(delta):
	if Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up"):
		velocity.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed.x
		velocity.y = (Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")) * speed.y
	velocity = move_and_slide(velocity)


func _on_Area2D_body_entered(close_body):
	close_body.is_in_group("exit")
	
