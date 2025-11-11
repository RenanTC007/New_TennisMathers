extends Label

func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var frases_negativas = [
		"Faltou nas aulas do Kumon?",
		"Esqueceu disso -> +c",
		"Aprisionado pelas correntes da regra da cadeia!",
		"Tendeu a zero...",
		"Melhor voltar para o Johnrney!",
		"Você sente suas derivadas rastejando pelas suas costas..."
	]	
	
	var frase = rng.randi_range(1, 5)
	$".".text = frases_negativas[frase]
