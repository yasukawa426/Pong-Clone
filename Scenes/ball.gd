extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_up_1"):
		apply_force(Vector2(0, -1000))
		
	if Input.is_action_pressed("move_left"):
		apply_force(Vector2(-1000, 0))
		
	if Input.is_action_pressed("move_down_1"):
		apply_force(Vector2(0, 1000))
		
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2(1000, 0))
