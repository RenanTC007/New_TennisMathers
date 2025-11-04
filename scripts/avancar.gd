extends Button


func _pressed():
	
	Global.rodada_atual += 1
	Global.score = 0
	Global.posicoes_x = []
	Global.time = 300
	Global.primeira_jogada = true
	
	get_tree().paused = false 
	get_tree().reload_current_scene()
