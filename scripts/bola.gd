extends RigidBody2D

# Coeficientes da função quadrática
@export var a: int = 0
@export var b: int = 0
@export var c: int = 0

var launched = false
var originX = 965.0
var originY = 619.0


func launch() -> void:
	launched = true

func _physics_process(_delta: float) -> void:
	if global_position.x >= 1800.0:
		launched = false
		linear_velocity.x = 0.0
		position = Vector2(originX, originY)
		
	if launched:
		linear_velocity.x = 300.0
		var x = (global_position.x - originX) / (105.0)
		position.y = ((a*pow(x,2)+b*x+c) * 99.0)*(-1) + originY
