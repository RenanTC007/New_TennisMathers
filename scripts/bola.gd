extends RigidBody2D

# Coeficientes da função quadrática
@export var a: float = 0
@export var b: float = 0
@export var c: float = 0

var launched = false
var originX = 965.0
var originY = 619.0

var is_jogador = false


func launch() -> void:
	launched = true

func _physics_process(_delta: float) -> void:
	if global_position.x >= 1800.0:
		if is_jogador:
			launched = false
			linear_velocity.x = 0
			position = Vector2(originX, originY)
			$".".visible = false
			await get_tree().create_timer(2.0).timeout
			$".".visible = true
			launched = true
		else:
			launched = false
			linear_velocity.x = 0
			position = Vector2(originX, originY)
		is_jogador = !is_jogador
	
		
	if launched:
		linear_velocity.x = 300.0
		var x = (global_position.x - originX) / (105.0)
		position.y = ((a*pow(x,2)+b*x+c) * 99.0)*(-1) + originY
