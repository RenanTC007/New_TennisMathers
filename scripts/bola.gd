extends RigidBody2D

# Coeficientes da função quadrática
@export var a: float = 0
@export var b: float = 0
@export var c: float = 0

var correct = AudioJogo.get_node("Correct")
var wrong = AudioJogo.get_node("Wrong")

var launched = false
var originX = 965.0
var originY = 619.0

var is_jogador = true
var score_added := false	
var function_changed := false



func launch() -> void:
	launched = true

func _physics_process(_delta: float) -> void:
	var label = $"../../UI/ndFunction"
	var original_color = Color.WHITE
	if global_position.x >= 1800.0:
		if is_jogador:
			if !Global.primeira_jogada:
				if Global.a == b and Global.b == c:
					if !score_added:
						score_added = true
						Global.score += 1
						$"../../UI/Score".text = str(Global.score)+ " / "+ str(clamp(Global.rodada_atual, 1, 10))
						
						label.modulate = Color(0, 1, 0)
						correct.play()      
						await get_tree().create_timer(0.5).timeout
						label.modulate = original_color
				else: 
					label.modulate = Color(1, 0, 0)
					wrong.play()      
					await get_tree().create_timer(0.5).timeout
					label.modulate = original_color
				if !function_changed:
					function_changed = true
					var c_str = ( "+" if c >= 0 else "" ) + str(c)
					$"../../UI/ndFunction".text = "y' = " + str(b) + "x" + c_str
			Global.primeira_jogada = false
			
			linear_velocity.x = 0
			launched = false
			
			
			# Function
			Global.function_generator()
			a = Global.a
			b = Global.b
			c = Global.c
			position = Vector2(originX + (-8)*99.0, ((a/2*pow(-8,2)+b*(-8)+c) * 99.0)*(-1) + originY)
			
			#$".".visible = false
			await get_tree().create_timer(1.0).timeout
			#$".".visible = true
			launched = true
			is_jogador = false
		else:
			score_added = false
			function_changed = false
			
			launched = false
			linear_velocity.x = 0
			var b_str = ( "+" if b >= 0 else "" ) + str(b)
			var c_str = ( "+" if c >= 0 else "" ) + str(c)

			$"../../UI/stFunction".text = "y = " + str(a/2) + "x²" + b_str + "x" + c_str


			a = 0
			b = 0
			c = 0
			position = Vector2(originX + (-8) * 99.0, originY + (-1)*(99.0 * ((-8)*Global.a+Global.b)))
			is_jogador = true
	
		
	if launched:			
		linear_velocity.x = 300.0
		var x = (global_position.x - originX) / (99.0)
		position.y = ((a/2*pow(x,2)+b*x+c) * 99.0)*(-1) + originY
