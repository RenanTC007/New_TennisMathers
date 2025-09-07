extends Control

func styleButtons():
	pass
	#for btn_name in ["Jogar", "Ajuda", "Sair"]:
		#var btn = get_node(btn_name)
		## Normal
		#var normal_style = StyleBoxFlat.new()
		##normal_style.bg_color = Color.TRANSPARENT
		##btn.add_theme_stylebox_override("normal", normal_style)	
		## Hover
		#var hover_style = StyleBoxFlat.new()
		#hover_style.bg_color = Color.ROYAL_BLUE
		#btn.add_theme_stylebox_override("hover", hover_style)	
		## Pressed
		#var pressed_style = StyleBoxFlat.new()
		#pressed_style.bg_color = Color.FOREST_GREEN
		#btn.add_theme_stylebox_override("pressed", pressed_style)
			#
						
func _ready():
	# Conectar sinais dos botões
	$Jogar.connect("pressed", Callable(self, "_on_play_pressed"))
	#$VBoxContainer/Ajuda.connect("pressed", Callable(self, "_on_instructions_pressed"))
	$Sair.connect("pressed", Callable(self, "_on_quit_pressed"))
	
	styleButtons()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/jogo.tscn")

#func _on_instructions_pressed():
	## Exibe uma tela de instruções
	#get_tree().change_scene_to_file("res://Instructions.tscn")

func _on_quit_pressed():
	# Sai do jogo
	get_tree().quit()
	
