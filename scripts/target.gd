extends Area2D
var rng = RandomNumberGenerator.new()

var paraX: int
var paraY: int


func _ready() -> void:
	#O conteudo do while abaixo serve para impedir que os alvos tenham o mesmo valor de x
	while(1 == 1):
		paraX = rng.randi_range(1, 8)
		paraY = rng.randi_range(1, 8)
		if paraX*82.5+744 not in Global.posicoes_x:
			Global.posicoes_x.append(paraX*82.5+744)#essa equação é para dar o valor em coordenadas a direita do eixo x
			Global.qtd_alvos+=1
			break
			
	position = Vector2(paraX*82.5+744, paraY*82+176)


func _on_body_entered(_body: Node2D) -> void:
	Global.score += 1	
	$"../Score".text = str(Global.score)
	Global.qtd_alvos -= 1
	queue_free()
