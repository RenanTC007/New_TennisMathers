extends Node


var score := 0
var time := 30
var posicoes_x = []
var qtd_alvos := 0
var rodada_atual := 0
var primeira_jogada = true
var stop_timer = true

var a = 0
var b = 0
var c = 0

func function_generator():
	var rng = RandomNumberGenerator.new()
	
	var ponto1 = rng.randi_range(-5, 5)
	var ponto2 = rng.randi_range(-5, 5)
	
	a = (float(ponto2) - float(ponto1)) / 8
	b = ponto2
	
	var max_hor_distance = 0
	for i in range(-4, 5):
		if a == 0:
			max_hor_distance = 16
			c = rng.randi_range(-4, 4)
			break

		var top1 = min(quadratic_formula(a/2, b, c-8, true), quadratic_formula(a/2, b, c-8, false))
		var top2 = max(quadratic_formula(a/2, b, c-8, true), quadratic_formula(a/2, b, c-8, false))
		var down1 = min(quadratic_formula(a/2, b, c+8, true), quadratic_formula(a/2, b, c+8, false))
		var down2 = max(quadratic_formula(a/2, b, c+8, true), quadratic_formula(a/2, b, c+8, false))
		
		if abs(down1 - top1) + abs(top2 - down2) >= max_hor_distance:
			max_hor_distance = abs(down1 - top1) + abs(top2 - down2)
			c = i
			
	if max_hor_distance == 0: function_generator()
		

func quadratic_formula(a1: float, a2: float, a3: float, positive: bool):
	var discriminant = pow(a2, 2) - 4 * a1 * a3
	if discriminant <= 0:
		return 0
	if positive:
		return (((-1) * a2 + sqrt(discriminant)) / (2 * a1))
	return (((-1) * a2 - sqrt(discriminant)) / (2 * a1))
