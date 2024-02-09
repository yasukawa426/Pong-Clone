extends Area2D

#velocidade de movimento (pixel/sec)
@export var speed: int = 600

#tamanho do player
var player_size: Vector2

#booleans q dizem qual jogar � qual � atualizado no _ready() do node main
#bool q diz se � o jogador 1
var is_player_one: bool = false

#bool q diz se � o jogador 2
var is_player_two: bool = false

# tamanho da tela
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size  #carrega o tamanho da tela

	#carrega o tamanho do player (largura, altura) e multiplica pela escala dele
	player_size = ($CollisionShape2D.get_shape().get_rect().size) * self.scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#vetor de movimento
	var movement: Vector2 = Vector2.ZERO

	#checar os inputs

	if is_player_one:
		if Input.is_action_pressed("move_up_1"):
			movement.y -= 1

		if Input.is_action_pressed("move_down_1"):
			movement.y += 1

	if is_player_two:
		if Input.is_action_pressed("move_up_2"):
			movement.y -= 1

		if Input.is_action_pressed("move_down_2"):
			movement.y += 1

	# modificamos os valores do vetor com a velocidade
	movement = movement * speed

	#atualizamos a posi��o do player
	position += movement * delta

	#limitamos o movimento pro player n sair da tela
	#min: (0 + metade da altura do player)
	#Max: (altura da tela - meta da altura do player)
	position = position.clamp(
		Vector2(0, 0 + player_size.y / 2), Vector2(screen_size.x, screen_size.y - player_size.y / 2)
	)
