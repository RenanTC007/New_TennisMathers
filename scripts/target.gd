extends Area2D
var rng = RandomNumberGenerator.new()

var paraX: int
var paraY: int


func _ready() -> void:
	# O conteudo do while abaixo serve para impedir que os alvos tenham o mesmo valor de x
	while(1 == 1):
		paraX = rng.randi_range(1, 8)
		paraY = rng.randi_range(-4, 4)
		if Global.qtd_alvos >= 8: break
		if paraX*105+965 not in Global.posicoes_x:
			Global.posicoes_x.append(paraX*105+965) # Essa equação é para dar o valor em coordenadas a direita do eixo x
			Global.qtd_alvos+=1
			break
			
	position = Vector2(paraX*105+965, paraY*(-99)+619)
	print(Global.posicoes_x)

func _on_body_entered(_body: Node2D) -> void:
	Global.score += 1	
	Global.qtd_alvos -= 1
	queue_free()
