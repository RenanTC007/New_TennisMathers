extends Button

var img_normal = preload("res://assets/sprites/Prinbles_GUI_Asset_Silent (1.0.0)/asset/png/Buttons/Square-Medium/SoundOn/Default.png")
var img_pressed = preload("res://assets/sprites/Prinbles_GUI_Asset_Silent (1.0.0)/asset/png/Buttons/Square-Medium/SoundOff/Default.png")
var audio = AudioJogo.get_node("Audio")


func _ready():
	icon = img_normal
	expand_icon = true 
	size = Vector2(128, 128)

func _pressed():
	# alterna entre os dois PNGs
	if icon == img_normal:
		icon = img_pressed
		audio.stop()
		
	else:
		icon = img_normal
		audio.play()
