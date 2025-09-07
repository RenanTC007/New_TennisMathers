extends Control
		
func _ready():
	$Jogar.connect("pressed", Callable(self, "_on_play_pressed"))
	$Ajuda.connect("pressed", Callable(self, "_on_tutorial_pressed"))
	$Sair.connect("pressed", Callable(self, "_on_quit_pressed"))
	

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/jogo.tscn")

func _on_tutorial_pressed():
	# Exibe uma tela de instruções
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")

func _on_quit_pressed():
	# Sai do jogo
	get_tree().quit()
	
