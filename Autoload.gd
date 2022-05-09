extends Node

var teleport_available = false
var keypickup = false
var keycount = 0
var next_level = 2
var playerpos = Vector2.ZERO

var disspawn_key = false

func change_to_next_level():
	var levelpath = "res://Levels/Level" + String(next_level) + ".tscn"
	get_tree().change_scene(levelpath)
	next_level += 1
