extends AnimatedSprite2D
signal reset_temp()
var path_follow = get_parent()
var pato_tween

# Called when the node enters the scene tree for the first time.
func _ready():
	pato_tween = create_tween()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_finished():
	print("Cuack")
	self.stop()
	emit_signal("reset_temp")
	pass # Replace with function body.
func cliqueado():
	pato_tween.tween_property(self,"scale",Vector2(1,2),1)
