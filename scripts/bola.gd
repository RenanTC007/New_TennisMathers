extends Node2D

# Coeficientes da função quadrática
@export var a: float = -0.02
@export var b: int = 0.0
@export var c: int = 0.0

# Velocidade no eixo X
@export var speed: float = 130.0

# Origem personalizada
@export var origin: Vector2 = Vector2(960, 624)

# Posição no "sistema de coordenadas matemático"
var x_pos: float = 0.0
var launched = false


func launch() -> void:
	launched = true

func _process(delta: float) -> void:
	if launched:
	# Avança no eixo X (sistema matemático)
		x_pos += speed * delta
		# Calcula Y pela função quadrática
		var y_math = a * pow(x_pos, 2) + b * x_pos + c

		
		# Converte para coordenadas de tela
		var screen_x = origin.x + x_pos*1.16483516 #diferença que tem de um eixo p o outro
		var screen_y = origin.y - y_math  # inverte porque no Godot o Y cresce para baixo
		
		# Atualiza posição da bola
		position = Vector2(screen_x, screen_y)
