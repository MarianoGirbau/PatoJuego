extends Node2D
var cuack_animation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func play():
	var pista = randi_range(0,8)
	if pista < 8:
		$Cuack.play()
	else:
		pista = randi_range(1,5)
		match pista:
			1:
				$Cuack_2.play()
			2:
				$Cuack_3.play()
			3:
				$Cuack_4.play()
			4:
				$Auto.play()
			5:
				$Riza.play()
	

func _on_finished():
	self.queue_free()
	
	pass # Replace with function body.




