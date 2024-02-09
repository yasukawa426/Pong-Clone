extends Area2D

#Velocidade que a bola se meche
@export var speed: float = 200

var movement: Vector2 


# Called when the node enters the scene tree for the first time.
func _ready():
	movement = Vector2(0, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += (movement.normalized() * speed) * delta
	
	#print_debug("Posição da bola: " + str(position))
