extends Control

@export var total_time: float = 30.0
@export var smooth_speed: float = 8.0

var display_time: float

func _ready():
	display_time = Global.time
	custom_minimum_size = Vector2(120, 120)
	set_process(true)

func _process(delta):
	# interpolação suave (Global.time convertido para float!)
	display_time = lerp(display_time, float(Global.time), delta * smooth_speed)

	if abs(display_time - Global.time) < 0.01:
		display_time = Global.time

	queue_redraw()

func _draw():
	var radius = min(size.x, size.y) * 0.5 - 8
	if radius <= 0:
		return
	
	var center = size * 0.5

	var current_time = clamp(display_time, 0, total_time)
	var ratio = current_time / total_time
	var angle = ratio * TAU

	var start_color = Color(0, 1, 0)
	var mid_color = Color(1, 1, 0)
	var end_color = Color(1, 0, 0)

	var ring_color: Color
	if ratio > 0.5:
		ring_color = start_color.lerp(mid_color, 1.0 - (ratio - 0.5) * 2.0)
	else:
		ring_color = mid_color.lerp(end_color, 1.0 - ratio * 2.0)

	draw_arc(center, radius, 0, TAU, 128, Color(0.2, 0.2, 0.2, 0.3), 10)
	draw_arc(center, radius, -PI/2, -PI/2 + angle, 64, ring_color, 10)
