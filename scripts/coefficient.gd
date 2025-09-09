extends LineEdit

@export var variable_name: String   # Nome da variável a ser alterada
@onready var bola = get_node("../../Entity/Bola")


func _on_text_submitted(new_text: String):
	if not bola.launched:
		if (variable_name == "CoefficientA"):
			bola.a = int(new_text)

		elif (variable_name == "CoefficientB"):
			bola.b = int(new_text)

		elif (variable_name == "CoefficientC"):
			bola.c = int(new_text)
			
	release_focus()
