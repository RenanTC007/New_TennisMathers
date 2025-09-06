extends Area2D
var score = 0

func _on_body_entered(_body: Node2D) -> void:
	queue_free()
	#score += 1
	#$"../ScoreLabel".text = str(score)
