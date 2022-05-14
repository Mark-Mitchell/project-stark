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

func add_stones(value):
	stone_count += value
	var stone = get_tree().get_nodes_in_group("stone_counter")
	stone[0].text = String(AL.stone_count)

func add_keys(variable):
	AL.keycount += variable
	var key = get_tree().get_nodes_in_group("key_counter")
	key[0].text = String(AL.keycount)
