extends Button

@onready var quadro = get_parent().get_node("Seta")
@onready var quadro2 = get_parent().get_node("Seta2")
@onready var bolita = get_parent().get_node("Entity/Bola")
@onready var quadro3 = get_parent().get_node("Seta3")
@onready var quadro4 = get_parent().get_node("Seta4")
@onready var quadro5 = get_parent().get_node("Seta5")

var i = 1

func _pressed() -> void:
	if i == 1:
		quadro.visible = not quadro.visible
		quadro2.visible = not quadro2.visible
	if i == 2:
		quadro2.visible = not quadro2.visible
		get_tree().paused = false
		await get_tree().create_timer(5).timeout
		get_tree().paused = true
		quadro3.visible = not quadro3.visible
	if i == 3:
		quadro3.visible = not quadro3.visible
		quadro4.visible = not quadro4.visible
	if i == 4:
		quadro4.visible = not quadro4.visible
		get_tree().paused = false
	if $"../UI/ndFunction".text != "y' =":
		get_tree().paused = true
		quadro5.visible = not quadro5.visible
	if i == 5:
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
		
		
		
	i+=1
