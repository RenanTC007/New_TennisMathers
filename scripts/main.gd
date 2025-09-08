extends Node2D


func _ready():
	# cria 2 cópias do nó Target
	for i in range(Global.rodada_atual - 1):
		var alvo = $Target.duplicate()
		add_child(alvo)   # adiciona o clone na cena
