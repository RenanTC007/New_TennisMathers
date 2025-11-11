extends Control

@export var total_time: float = 30.0
var time_left: float

func _ready():
	time_left = total_time
	set_process(true)
	custom_minimum_size = Vector2(120, 120)

func _process(delta):
	if time_left > 0:
		time_left = max(0.0, time_left - delta)
	queue_redraw()

func _draw():
	var radius = min(size.x, size.y) * 0.5 - 8
	if radius <= 0:
		return

	var center = size * 0.5
	var ratio = time_left / total_time
	var angle = ratio * TAU  # TAU = 2π

	# cor interpolada do círculo
	var start_color = Color(0, 1, 0)   # verde
	var mid_color = Color(1, 1, 0)     # amarelo
	var end_color = Color(1, 0, 0)     # vermelho

	var ring_color: Color
	if ratio > 0.5:
		# interpolar de verde (1) até amarelo (0.5)
		ring_color = start_color.lerp(mid_color, 1.0 - (ratio - 0.5) * 2.0)
	else:
		# interpolar de amarelo (0.5) até vermelho (0)
		ring_color = mid_color.lerp(end_color, 1.0 - ratio * 2.0)

	# círculo de fundo
	draw_arc(center, radius, 0, TAU, 128, Color(0.2, 0.2, 0.2, 0.3), 10)

	# círculo de tempo restante com cor dinâmica
	draw_arc(center, radius, -PI/2, -PI/2 + angle, 64, ring_color, 10)
