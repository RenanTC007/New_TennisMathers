extends Node


var score := 0
var time := 300
var posicoes_x = []
var qtd_alvos := 0
var rodada_atual := 1
var primeira_jogada = true

var a = 0
var b = 0
var c = 0

func function_generator():
	var rng = RandomNumberGenerator.new()
	
	var ponto1 = rng.randi_range(-4, 4)
	var ponto2 = rng.randi_range(-4, 4)
	
	a = (float(ponto2) - float(ponto1)) / 8
	b = ponto2
	var maior = 0
	var hor_distance
	for i in range(-4, 5):
		if a == 0:
			c = rng.randi_range(-4, 4)
			break
		elif a > 0: hor_distance = root_difference(a, b, c-8)
		else: hor_distance = root_difference(a, b, c+8)
		
		if hor_distance > maior:
			c = i


func root_difference(x: int, y: int, z: int):
	var discriminant = pow(y, 2)-4*x*z
	if discriminant < 0: return false
	if x == 0: return 100
	return abs(-y+sqrt(pow(y, 2)-4*x*z)-(-y-sqrt(pow(y, 2)-4*x*z)))
