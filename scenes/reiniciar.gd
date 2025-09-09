extends Button


func _pressed():
	Global.score = 0
	Global.time = 30
	Global.posicoes_x = []
	Global.qtd_alvos = 0
	Global.rodada_atual = 1
	
	get_tree().paused = false 
	get_tree().reload_current_scene()
