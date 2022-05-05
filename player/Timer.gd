extends NinePatchRect

var time = 120


func _on_Timer_timeout():
	time -= 1
	$Timer.start()
	$Label.set_text(String(time))
