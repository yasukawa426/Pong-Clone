extends Area2D

#velocidade de movimento (pixel/sec)
@export var speed: int = 600


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#vetor de movimento
	var movement: Vector2 = Vector2.ZERO
	
	#checar os inputs
	if Input.is_action_pressed("move_up_1"):
		movement.y -= 1
		
	if Input.is_action_pressed("move_down_1"):
		movement.y += 1
		
	
	# modificamos os valores do vetor com a velocidade
	movement = movement * speed
	
	
	#atualizamos a posição do player
	position += movement * delta
	
