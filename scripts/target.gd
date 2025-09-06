extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	Global.score += 1	
	$"../Score".text = str(Global.score)
	queue_free()
