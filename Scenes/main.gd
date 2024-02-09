extends Node

#variavel que conta o score primeiro
var first_score:int = 0

#variavel que conta o score segundo
var second_score:int = 0

#Instancia do jogador 1
var player1: Node

#Instancia do jogador 2
var player2: Node

#Instancia da bola
var ball: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	player1 = $Entities/Player1
	player2 = $Entities/Player2
	
	ball = $Entities/Ball
	
	# identifica qual jogador é qual
	player1.is_player_one = true
	player2.is_player_two = true
	
	print_debug("Player1: " + " " + str(player1.player_size))
	print_debug("Player2: " + " " + str(player2.player_size))
	
	# Espera 1 segundo antes de começar
	await get_tree().create_timer(1.0).timeout
	
	start_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

#Método chamado para começar o jogo
func start_game():
	ball.position = $Markers/BallPosition.position
	
	var random_x = randf_range(-1.0, 1.0)
	var random_y = randf_range(-1.0, 1.0)
	
	print_debug(str(random_x) + ", " + str(random_y))
	
	if random_x < 0:
		random_x = floor(random_x)
	else:
		random_x = ceil(random_x)
		
	if random_y < 0:
		random_y = floor(random_y)
	else:
		random_y = ceil(random_y)
		
	print_debug(str(random_x) + ", " + str(random_y))
	
	ball.movement = Vector2(random_x, random_y)
	
	player1.position = $Markers/Player1Position.position
	player2.position = $Markers/Player2Position.position

#Acontece quando o jogador detecta alguma colisão com a bola
func _on_player_body_entered(body):
	print_debug("Colisão detectada nos players")
	
	#pegamos o vetor de movimento da bola atual
	var movement: Vector2 = ball.movement
	
	#vamos inverter apenas o eixo x
	movement.x = movement.x * -1
	
	#atualizamos o valor na bola
	ball.movement = movement

#Acontece quando uma das paredes detectam colisão com a bola
func _on_wall_area_entered(area):
	print_debug("Colisão detectada nas paredes")

#Acontece quando o teto ou chão detecta uma colisão com a bola
func _on_ceiling_area_entered(area):
	print_debug("Colisão detectada no teto/chão")
	
	#pegamos o vetor de movimento da bola atual
	var movement: Vector2 = ball.movement
	
	#vamos inverter apenas o eixo y
	movement.y = movement.y * -1
	
	#atualizamos o valor na bola
	ball.movement = movement
