extends AnimatedSprite2D
signal reset_temp()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_finished():
	print("Cuack")
	self.stop()
	emit_signal("reset_temp")
	pass # Replace with function body.
