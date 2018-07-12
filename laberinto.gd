extends Node2D

signal gane 

func _ready():
	get_node("musica/intro_la_yumba").play()
	pass
	
func _on_personaje_chocando(colisionador):
	if(colisionador.get_parent().get_parent() == get_node("items")):
		sonarItemCollected()
		agarrarItem(colisionador)
	else: 
		sonarColision()
	if(colisionador == get_node("meta")):
		get_node("ganaste/Panel/anim").play("mostrar")
		get_node("sonidos_laberinto/win").play()
		yield( get_node("ganaste/Panel/anim"), "animation_finished" )
		emit_signal("gane")

func sonarColision():
	if(!get_node("sonidos_laberinto/collsion").is_playing()):
		get_node("sonidos_laberinto/collsion").play()

func sonarItemCollected():
	get_node("sonidos_laberinto/item_collected").play()

func _on_personaje_caminando():
	if(!get_node("sonidos_laberinto/walk").is_playing()):
		get_node("sonidos_laberinto/walk").play()

func _on_escena_gane():
	get_node("/root/global").siguienteNivel()
	
func agarrarItem(item):
	get_node("inventario").agregarItem(item.get_name())
	item.get_parent().queue_free()

