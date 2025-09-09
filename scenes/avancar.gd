extends Button


func _pressed():
	Global.rodada_atual += 1
	Global.posicoes_x = []
	Global.time = 30
	get_tree().paused = false 
	get_tree().reload_current_scene()
