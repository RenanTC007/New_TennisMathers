extends Label


func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var frases_positivas = [
		"Limites tornam o impossível possível!",
		"Funções crescem… e você junto com elas!",
		"Derivar é evoluir!",
		"Sua resiliência é contínua e diferenciável!",
		"Aceita uma derivada de abacate?"
		]

	var frase = rng.randi_range(1, 4)
	$".".text = frases_positivas[frase]
