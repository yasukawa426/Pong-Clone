extends Area2D

#Velocidade que a bola se meche
@export var speed: float = 200

#Cena que representa a particula de acerto
@export var hit_particle_scene: PackedScene

var movement: Vector2 


# Called when the node enters the scene tree for the first time.
func _ready():
	movement = Vector2(0, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += (movement.normalized() * speed) * delta
	
	#print_debug("Posição da bola: " + str(position))

# Assim que acertar alguém, emite as particulas
func _on_area_entered(area):
	var particle: GPUParticles2D  = hit_particle_scene.instantiate()
	#Não é necessário mecher na posição, já que está sendo instaciado como filho da bola, esta na mesma posição da bola
	#O (0,0) da particula é o centro da bola
	#A posição do efeito é a posição atual da bola
	#particle.position = position
	
	add_child(particle)
	
	particle.emitting = true
	
	#Espera terminar o efeito
	await particle.finished
	##Deleta o nodo
	particle.queue_free()
	
	

	
