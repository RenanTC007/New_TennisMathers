extends Node2D


func _ready() -> void:
	#Rodada
	$"../Rodada".text = "Rodada " + str(Global.rodada_atual)
	
	#Tempo
	_on_timer_timeout()
	$"../Timer".start()

	
	#Pontuação
	$"../Score".text = str(Global.score)


func _process(delta: float) -> void:
	if Global.qtd_alvos == 0:
		mostrar_popup()
		
		
func mostrar_popup():
	$"../Canvada/Painel".visible = true
	get_tree().paused = true 
	
	
func _on_timer_timeout() -> void:
	$"../Time".text = str(Global.time)
	Global.time -= 1
