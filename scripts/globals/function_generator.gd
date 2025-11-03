extends Node


func function_generator():
	var rng = RandomNumberGenerator.new()
	
	var ponto1 = rng.randi_range(-8, 8)
	var ponto2 = rng.randi_range(-8, 8)
	
	var a = (ponto2 - ponto1) / 8
	var b = ponto2
	var c
	while true:
		c = rng.randi_range(-8, 8)
		var conc_up_x = abs(root_difference(a, b, c-8))
		var conc_down_x = abs(root_difference(a, b, c+8))
		if (a > 0 and conc_up_x > 2) or (a < 0 and conc_down_x > 2): break
	
	return Vector3(a, b, c)		
			
func root_difference(a: int, b: int, c: int):
	return -b+sqrt(pow(b, 2)-4*a*c)-(-b-sqrt(pow(b, 2)-4*a*c))
