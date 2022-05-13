extends Node

var teleport_available = false
var keycount = 0
var stone_count = 0
var next_level = 2
var playerpos = Vector2.ZERO
var pressureplate_pressed = false

func change_to_next_level():
	var levelpath = "res://Levels/Level" + String(next_level) + ".tscn"
	get_tree().change_scene(levelpath)
	next_level += 1
