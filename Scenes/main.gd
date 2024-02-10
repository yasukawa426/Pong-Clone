extends Node

#pontos maximos para ganhar o jogo
@export var MAX_POINTS: int = 10

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

var initial_speed:int 

# Called when the node enters the scene tree for the first time.
func _ready():
	player1 = $Entities/Player1
	player2 = $Entities/Player2
	
	ball = $Entities/Ball
	initial_speed = ball.speed
	
	# identifica qual jogador é qual
	player1.is_player_one = true
	player2.is_player_two = true
	
	print_debug("Player1: " + " " + str(player1.player_size))
	print_debug("Player2: " + " " + str(player2.player_size))
	
	$Sounds/Music.play()
	
	start_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

#Método chamado para começar o jogo
#Escolhe uma direção aleatoria pra bola e a manda
func start_game():	
	# Espera 1 segundo antes de começar
	await get_tree().create_timer(1.0).timeout
	
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


#Acontece quando o jogador detecta alguma colisão com a bola
func _on_player_area_entered(body):
	$Sounds/Pong.play()
	
	print_debug("Colisão detectada nos players ------------")
	
	#pegamos o vetor de movimento da bola atual
	var movement: Vector2 = ball.movement
	
	#vamos inverter apenas o eixo x
	movement.x = movement.x * -1
	
	#atualizamos o valor na bola
	ball.movement = movement

#Acontece quando uma das paredes detectam colisão com a bola
func _on_wall_area_entered(area):
	$Sounds/Score_Sound.play()
	print_debug("Colisão detectada nas paredes")

#Acontece quando o teto ou chão detecta uma colisão com a bola
func _on_ceiling_area_entered(area):
	$Sounds/Pong.play()
	
	print_debug("Colisão detectada no teto/chão")
	
	#pegamos o vetor de movimento da bola atual
	var movement: Vector2 = ball.movement
	
	#vamos inverter apenas o eixo y
	movement.y = movement.y * -1
	
	#atualizamos o valor na bola
	ball.movement = movement

#restart o round dps de um ponto
func restart_round():
	ball.speed = initial_speed
	
	#para o movimento da bola
	ball.movement = Vector2(0, 0)
	
	#reseta a posição das entidades
	ball.position = $Markers/BallPosition.position
	player1.position = $Markers/Player1Position.position
	player2.position = $Markers/Player2Position.position
	
	#inicia o jogo
	start_game()
	

#restart o game do zero
func restart_game():
	ball.speed = initial_speed
	
	#para o movimento da bola
	ball.movement = Vector2(0, 0)
	
	#reseta a posição das entidades
	ball.position = $Markers/BallPosition.position
	player1.position = $Markers/Player1Position.position
	player2.position = $Markers/Player2Position.position
	
	first_score = 0
	$"UI-Stage/HUD".update_first_score(first_score)
	
	second_score = 0
	$"UI-Stage/HUD".update_second_score(second_score)
	
	#inicia o jogo
	start_game()
	

#acertou a parede esquerda
func _on_left_wall_area_entered(area):
	first_score += 1
	$"UI-Stage/HUD".update_first_score(first_score)
	
	if first_score < MAX_POINTS:
		restart_round()
	
	else:
		restart_game()

#acertou a parede direita
func _on_right_wall_area_entered(area):
	second_score += 1
	$"UI-Stage/HUD".update_second_score(second_score)
	
	if second_score < MAX_POINTS:
		restart_round()
	
	else:
		restart_game()
