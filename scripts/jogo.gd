extends Node2D
var rng = RandomNumberGenerator.new()
var paraX: int
var paraY: int


func _ready():
	# cria 2 cópias do nó Target
	for i in range(Global.rodada_atual - 1):
		var alvo = $Target.duplicate()
		add_child(alvo)   # adiciona o clone na cena


func _process(delta: float) -> void:
	if Global.qtd_alvos == 0:
		mostrar_popup()
	
	
func mostrar_popup():
	$Canvada/Painel.visible = true
	get_tree().paused = true 
