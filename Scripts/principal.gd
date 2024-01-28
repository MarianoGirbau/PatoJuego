extends Node2D
var pausado = false
var clicks = 0
var sprite_pato
var dialogo_pato
var texto_pato
var cuack = preload("res://Scenes/cuack.tscn")

func _ready():
	iniciar_musica_fondo()
	$Canvas_game_over.connect("Reiniciar",reinicio)
	$CanvasPausa.connect("Reiniciar",reinicio)
	$CanvasPausa.connect("Continuar",continuar)
	$CanvasPausa.hide()
	$Canvas_game_over.hide()
	$Fondo/RichTextLabel.text = str(clicks)
	sprite_pato =$Fondo/Path2D/PathFollow2D/TextureButton/AnimatedSprite2D
	dialogo_pato = $Fondo/Path2D/PathFollow2D/TextureButton/TextureRect
	texto_pato = $Fondo/Path2D/PathFollow2D/TextureButton/TextureRect/Dialogos
	sprite_pato.connect("reset_temp",reiniciar_temporizador)

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):

	if $PatoTimer.time_left <= 6 && $PatoTimer.time_left > 4:
		sprite_pato.animation = "pato_triste"
		$Fondo/Path2D/PathFollow2D.detener()
		dialogo_pato.show()
		texto_pato.text = "clickeame o \nmoriré"
		
	elif $PatoTimer.time_left <= 4:
		sprite_pato.animation = "pato_moribundo"
		$Fondo/Path2D/PathFollow2D.detener()
		texto_pato.text = "en serio we,\nme voy a morir"
	else:
		sprite_pato.animation = "normal"
		if pausado:
			$Fondo/Path2D/PathFollow2D.detener()
		else:
			$Fondo/Path2D/PathFollow2D.continuar()
		dialogo_pato.hide()
	print(sprite_pato.animation)

func _on_texture_button_pressed():
	clicks += 1
	$Fondo/RichTextLabel.text = str(clicks)
	var new_cuack_player = cuack.instantiate()
	add_child(new_cuack_player)
	new_cuack_player.play()
	sprite_pato.cliqueado()
	if sprite_pato.animation == "normal" :
		sprite_pato.play("normal")
	elif  sprite_pato.animation == "pato_moribundo" :
		sprite_pato.play("pato_moribundo")
	elif  sprite_pato.animation == "pato_triste" :
		sprite_pato.play("pato_triste")
	#reiniciar_temporizador()


func _on_pato_timer_timeout():
	game_over()

func game_over():
	$musica_fondo.stop()
	clicks = 0
	$Canvas_game_over.show()
	$Canvas_game_over/TextureRect.position=$AdentroGO.position

func reinicio():
	pausado = false
	iniciar_musica_fondo()
	$Canvas_game_over.hide()
	$CanvasPausa.hide()
	$Canvas_game_over/TextureRect.position=$Afuera.position
	$CanvasPausa/TextureRect.position=$Afuera.position
	reiniciar_temporizador()
	clicks = 0
	$Fondo/RichTextLabel.text = str(clicks)


func _on_menu_button_pressed():
	pausado = true
	$CanvasPausa.show()
	$musica_fondo.stop()
	$CanvasPausa/TextureRect.position=$Adentro.position
	$PatoTimer.set_paused(true)


func continuar():
	pausado = false
	iniciar_musica_fondo()
	$CanvasPausa.hide()
	$PatoTimer.set_paused(false)

func reiniciar_temporizador():
	# Esta función reinicia el temporizador desde cero
	# Establece el tiempo del temporizador al valor original
	$PatoTimer.wait_time = 10

	# Inicia el temporizador
	$PatoTimer.start()

func iniciar_musica_fondo():
	$musica_fondo.play()
	#$musica_fondo.set_loop(true)



