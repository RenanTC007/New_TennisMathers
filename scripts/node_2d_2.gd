extends Node2D

@onready var quadro5 = get_parent().get_node("Seta5")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var verif = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $"../UI/ndFunction".text != "y' =":
		if verif:
			verif = false
			get_tree().paused = true
			quadro5.visible = not quadro5.visible
			await get_tree().create_timer(5).timeout
			get_tree().paused = false
			get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
			
		
