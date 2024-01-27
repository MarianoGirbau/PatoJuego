extends Node2D

var clicks = 0
var sprite_pato
var dialogo_pato
var texto_pato
var cuack = preload("res://Scenes/cuack.tscn")

func _ready():
	$Canvas_game_over.connect("Reiniciar",reinicio)
	$CanvasPausa.connect("Reiniciar",reinicio)
	$CanvasPausa.connect("Continuar",continuar)
	$CanvasPausa.hide()
	$Canvas_game_over.hide()
	$Fondo/RichTextLabel.text = str(clicks)
	sprite_pato =$Fondo/TextureButton/AnimatedSprite2D
	dialogo_pato = $Fondo/TextureButton/TextureRect
	texto_pato = $Fondo/TextureButton/TextureRect/Dialogos
	#sprite_pato.connect("_on_animated_sprite_2d_animation_finished", self, "_on_animation_finished")

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):

	if $PatoTimer.time_left <= 5 && $PatoTimer.time_left > 3:
		sprite_pato.animation = "pato_triste"
		dialogo_pato.show()
		texto_pato.text = "clickeame o moriré"
	elif $PatoTimer.time_left <= 3:
		sprite_pato.animation = "pato_moribundo"
		texto_pato.text = "en serio we, me voy a morir"
	else:
		sprite_pato.animation = "normal"
		dialogo_pato.hide()


func _on_texture_button_pressed():
	clicks += 1
	var new_cuack_player = cuack.instantiate()
	add_child(new_cuack_player)
	new_cuack_player.play()
	$Fondo/RichTextLabel.text = str(clicks)
	sprite_pato.play("normal")
	reiniciar_temporizador()


func _on_pato_timer_timeout():
	game_over()

func game_over():
	clicks = 0
	$Canvas_game_over.show()
	$Canvas_game_over/TextureRect.position=$AdentroGO.position

func reinicio():
	$Canvas_game_over.hide()
	$CanvasPausa.hide()
	$Canvas_game_over/TextureRect.position=$Afuera.position
	$CanvasPausa/TextureRect.position=$Afuera.position
	reiniciar_temporizador()


func _on_menu_button_pressed():
	$CanvasPausa.show()
	
	$CanvasPausa/TextureRect.position=$Adentro.position
	$PatoTimer.set_paused(true)


func continuar():
	$CanvasPausa.hide()
	$PatoTimer.set_paused(false)

func reiniciar_temporizador():
	# Esta función reinicia el temporizador desde cero
	# Establece el tiempo del temporizador al valor original
	$PatoTimer.wait_time = 10

	# Inicia el temporizador
	$PatoTimer.start()



