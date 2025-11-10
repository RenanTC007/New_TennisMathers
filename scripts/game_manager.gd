extends Node2D


func _ready() -> void:
	# Globais
	Global.rodada_atual += 1
	Global.score = 0
	Global.posicoes_x = []
	Global.primeira_jogada = true
	
	#Rodada
	$"../UI/Rodada".text = "Rodada " + str(Global.rodada_atual)
	if Global.rodada_atual % 5 == 0 and Global.rodada_atual:
		Global.time += 10
	
	#Tempo
	_on_timer_timeout()
	$"../Timer".start()
	$"../UI/Time".text = str(Global.time)

	
	#Pontuação
	$"../UI/Score".text = "0 / "+ str(clamp(Global.rodada_atual, 1, 10))
	


func _process(_delta: float) -> void:
	if Global.score == clamp(Global.rodada_atual, 1, 10):
		await get_tree().create_timer(1.0).timeout
		mostrar_popup_vitoria()
	if Global.time < 0:
		mostrar_popup_derrota()
		
# Popups
func mostrar_popup_vitoria():
	if (Global.rodada_atual + 1) % 5 == 0: 
		$"../CanvasLayer/CanvaVitoria/PainelVitoria/Texto".text = "Você Ganhou! \n +10 segundos"
		
	$"../CanvasLayer/CanvaVitoria/PainelVitoria".visible = true
	get_tree().paused = true 
	
func mostrar_popup_derrota():
	$"../CanvasLayer/CanvaDerrota/PainelDerrota".visible = true
	get_tree().paused = true 

# Timer
func _on_timer_timeout() -> void:
	if Global.stop_timer: return
	
	$"../UI/Time".text = str(Global.time)
	Global.time -= 1
