extends Area2D
var stones = 0
var keys = 0

var stone_positions = []
var key_positions = []

func _ready():
	var stones = get_tree().get_nodes_in_group("stone")
	var keys = get_tree().get_nodes_in_group("key")
	for x in stones:
		stone_positions.push_back(x.position)
	for x in keys:
		key_positions.push_back(x.position)

func _on_ResetWall_body_entered(body):
	if body.name == "SkeletalPlayer":
		var level = get_tree().get_nodes_in_group("level")[0]
		var rock = load("res://Objects/rock.tscn")
		var key = load("res://Objects/Key.tscn")
		var rocks = get_tree().get_nodes_in_group("stone")
		var new_rock_pos = []
		var keys = get_tree().get_nodes_in_group("key")
		var new_key_pos = []
		
		#Respawn Rocks not collected yet
		for x in rocks:
			new_rock_pos.append(x.position)
		for x in stone_positions:
			if new_rock_pos.has(x):
				pass
			else:
				var new_rock = rock.instance()
				new_rock.position = x
				level.add_child(new_rock)
		
		#Respawn Keys not collected yet
		for x in keys:
			new_key_pos.append(x.position)
		for x in key_positions:
			if new_key_pos.has(x):
				pass
			else:
				var new_key = key.instance()
				new_key.position = x
				level.add_child(new_key)
		
		AL.add_keys(0)
		AL.add_stones(0)



func _on_ResetWall_body_exited(body):
	if body.name == "SkeletalPlayer":
		pass
