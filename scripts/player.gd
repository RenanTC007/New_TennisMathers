extends CharacterBody2D


const SPEED = 300.0
var JUMP_VELOCITY = -400.0
var is_tocando : bool = false
var cont: int = 0
var x



#@onready var ballon = get_node("res://bola.tscn")
@onready var animator := $AnimationPlayer
var direction_horizontal
var direction_vertical

func _physics_process(_delta: float) -> void:

	direction_vertical = Input.get_axis("mover_cima", "mover_baixo")
	if direction_vertical:
		velocity.y = direction_vertical * SPEED
		
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	

		
	direction_horizontal = Input.get_axis("mover_esq", "mover_dir")
	if direction_horizontal:
		velocity.x = direction_horizontal * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
		
	if Input.is_action_just_pressed("toque_baixo1"):
		is_tocando = true
	
	handle_animation()
	move_and_slide()
	

func handle_animation():
	var anim = "parado"
	
	if (direction_horizontal or direction_vertical) and is_on_floor():
		anim = "andando"
	
	if is_tocando:
		anim = "toque"
	
	if animator.name != anim:
		animator.play(anim)
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "toque":
		is_tocando = false


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("bola"):
		body.launch()
		
		
	
		#if body.has_method("apply_central_impulse"):
			#body.apply_central_impulse(Vector2(0.4, -0.4))
#func _anda_bola(delta: float, body) -> void:
	#print("porra")
	#print(delta)
	#x = body.position.x
	#body.position.y = -x*x
	
