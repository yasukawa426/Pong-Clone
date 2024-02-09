extends Node

#variavel que conta o score primeiro
var first_score:int = 0

#variavel que conta o score segundo
var second_score:int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	# identifica qual jogador é qual
	$Player1.is_player_one = true
	$Player2.is_player_two = true
	
	print_debug("Player1: " + " " + str($Player1.player_size))
	print_debug("Player2: " + " " + str($Player2.player_size))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Acontece quando o jogador detecta alguma colisão com a bola
func _on_player_body_entered(body):
	print_debug("Colisão detectada nos players")

#Acontece quando uma das paredes detectam colisão com a bola
func _on_wall_area_entered(area):
	print_debug("Colisão detectada nas paredes")

#Acontece quando o teto ou chão detecta uma colisão com a bola
func _on_ceiling_area_entered(area):
	print_debug("Colisão detectada no teto/chão")
