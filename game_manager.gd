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
		mostrar_popup_vitoria()
	if Global.time == -1:
		mostrar_popup_derrota()
		
		
func mostrar_popup_vitoria():
	$"../CanvaVitoria/PainelVitoria".visible = true
	get_tree().paused = true 
	
	
func _on_timer_timeout() -> void:
	$"../Time".text = str(Global.time)
	Global.time -= 1

func mostrar_popup_derrota():
	$"../CanvaDerrota/PainelDerrota".visible = true
	get_tree().paused = true 
