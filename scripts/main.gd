extends Node2D



func _ready():
	var bola = $Entity/Bola
	
	# cria 2 cópias do nó Target
	for i in range(Global.rodada_atual - 1):
		var alvo = $Entity/Target.duplicate()
		add_child(alvo)   # adiciona o clone na cena
	await get_tree().create_timer(2.0).timeout
	bola.launch()
