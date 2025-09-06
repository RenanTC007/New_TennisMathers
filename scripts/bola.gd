extends RigidBody2D

# Coeficientes da função quadrática
@export var a: int = -1
@export var b: int = 2
@export var c: int = 10

var launched = false
var originX = 744.0
var originY = 506.0


func launch() -> void:
	launched = true

func _physics_process(delta: float) -> void:
	if launched:
		linear_velocity.x = 200.0
		var x = (global_position.x - originX) / (82.0)
		position.y = ((a*pow(x,2)+b*x+c) * 82.0)*(-1) + originY
