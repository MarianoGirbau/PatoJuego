extends PathFollow2D

var Speed = 0.1
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += delta* Speed

func detener():
	Speed = 0

func continuar():
	Speed = 0.1
