extends Label

var bola
func _ready():
	var bola = get_node("../Bola")
	$".".text = str(bola.a) + "x² + " + str(bola.b) + "x + " + str(bola.c)
