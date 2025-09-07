extends Node2D
var rng = RandomNumberGenerator.new()
var paraX: int
var paraY: int


func _ready():

	# cria 2 cópias do nó Target
	for i in range(7):
		var alvo = $Target.duplicate()
		add_child(alvo)   # adiciona o clone na cena
