extends CanvasLayer


signal Reiniciar()
signal Continuar()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cerrar_pressed():
	get_tree().quit()


func _on_reiniciar_pressed():
	emit_signal("Reiniciar")


func _on_continuar_pressed():
	emit_signal("Continuar")
