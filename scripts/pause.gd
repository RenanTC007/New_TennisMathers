extends Button


func _pressed():
	get_tree().paused = true 	
	$"../CanvasLayer/CanvaPause/PainelPause".visible = true
