extends StaticBody2D

onready var lock = $Lock
onready var Door = $Door
var open = false

func _ready():
	Door.region_rect = Rect2(10,595,48,29)

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		op_en()

func op_en():
	fade_lock()

func fade_lock():
	if AL.teleport_available and AL.keycount > 0:
		for x in range(1,6):
			lock.set_modulate(lerp(get_modulate(), Color(1,1,1,0), 0.2*x))
			$LockFadeOut.start()
			yield($LockFadeOut, "timeout")
		open_door()

func open_door():
	AL.keycount -= 1
	Door.region_rect = Rect2(75,589,45,37)
	$LockFadeOut.start(.1)
	yield($LockFadeOut, "timeout")
	Door.region_rect = Rect2(135,586,50,49)
	$LockFadeOut.start(.25)
	yield($LockFadeOut, "timeout")
	switch_to_next_level()

func switch_to_next_level():
	AL.change_to_next_level()
