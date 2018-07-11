extends HBoxContainer

func _ready():
	#intro_la_yumba
	get_node("intro_la_yumba").play()
	pass
	
func _on_jugar_pressed():
	play_click()
	get_node("Timer").start()
	yield(get_node("Timer"), "timeout")
	get_node("/root/global").empezarJuego()

func _on_salir_pressed():
	play_click()
	get_node("Timer").start()
	yield(get_node("Timer"), "timeout")
	get_tree().quit()

func _on_acerca_pressed():
	play_click()
	get_node("Timer").start()
	yield(get_node("Timer"), "timeout")
	get_tree().change_scene("res://info.tscn")

func play_click():
	#play
	get_node("click").play()
