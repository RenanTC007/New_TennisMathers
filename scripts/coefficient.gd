extends LineEdit

@export var variable_name: String   # Nome da variável a ser alterada
@onready var bola = get_node("../Bola")

func _ready():
	text_submitted.connect(_on_text_submitted)

func _on_text_submitted(new_text: String):
	if (variable_name == "CoefficientA"):
		bola.a = int(new_text)

	elif (variable_name == "CoefficientB"):
		bola.b = int(new_text)

	elif (variable_name == "CoefficientC"):
		bola.c = int(new_text)

	release_focus()
