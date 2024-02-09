extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_first_score(score: int):
	$FirstScore.text = str(score)


func update_second_score(score: int):
	$SecondScore.text = str(score)
	
