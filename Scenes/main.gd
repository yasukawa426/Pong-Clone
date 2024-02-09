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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
