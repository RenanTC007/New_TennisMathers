extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".text = str("Rodada ", Global.rodada_atual, " Concluída")
