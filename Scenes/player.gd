extends Area2D

#velocidade de movimento (pixel/sec)
@export var speed: int = 600


#booleans q dizem qual jogar é qual é atualizado no _ready() do node main
#bool q diz se é o jogador 1
var is_player_one: bool = false

#bool q diz se é o jogador 2
var is_player_two: bool = false

# tamanho da tela
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size #carrega o tamanho da tela


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#vetor de movimento
	var movement: Vector2 = Vector2.ZERO
	
	#checar os inputs
	
	if (is_player_one):
		if Input.is_action_pressed("move_up_1"):
			movement.y -= 1
			
		if Input.is_action_pressed("move_down_1"):
			movement.y += 1
	
	if (is_player_two):	
		if Input.is_action_pressed("move_up_2"):
			movement.y -= 1
			
		if Input.is_action_pressed("move_down_2"):
			movement.y += 1
	
	# modificamos os valores do vetor com a velocidade
	movement = movement * speed
	
	
	#atualizamos a posição do player
	position += movement * delta
	
	#limitamos o movimento pro player n sair da tela
	position = position.clamp(Vector2(24, 24), screen_size)
	
