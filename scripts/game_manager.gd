extends Node2D


func _ready() -> void:
	#Rodada
	$"../UI/Rodada".text = "Rodada " + str(Global.rodada_atual)
	
	#Tempo
	_on_timer_timeout()
	$"../Timer".start()
	
	
	
	#Pontuação
	$"../UI/Score".text = str(Global.score)


func _process(_delta: float) -> void:
	if Global.score == clamp(Global.rodada_atual, 1, 10):
		await get_tree().create_timer(1.0).timeout
		mostrar_popup_vitoria()
	if Global.time == -1:
		mostrar_popup_derrota()
		
# Popups
func mostrar_popup_vitoria():
	$"../CanvasLayer/CanvaVitoria/PainelVitoria".visible = true
	get_tree().paused = true 
	
func mostrar_popup_derrota():
	$"../CanvasLayer/CanvaDerrota/PainelDerrota".visible = true
	get_tree().paused = true 

# Timer
func _on_timer_timeout() -> void:
	$"../UI/Time".text = str(Global.time)
	Global.time -= 1
	
# Function
