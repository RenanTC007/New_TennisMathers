extends Node2D





func _ready():
	var bola = $Entity/Bola
	
	# cria 2 cópias do nó Target
	#for i in range(Global.rodada_atual - 1):
		#var alvo = $Entity/Target.duplicate()
		#add_child(alvo)   # adiciona o clone na cena
	bola.global_position.x = 1800.0
