
extends KinematicBody2D

signal chocando
signal caminando

const WALK_SPEED = 500

var velocity = Vector2()

func _physics_process(delta):
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -WALK_SPEED
		velocity.y = 0
	elif (Input.is_action_pressed("ui_right")):
		velocity.x =  WALK_SPEED
		velocity.y = 0
	elif(Input.is_action_pressed("ui_up")):
		velocity.y = -WALK_SPEED
		velocity.x = 0
	elif (Input.is_action_pressed("ui_down")):
		velocity.x = 0
		velocity.y = WALK_SPEED
	else:
		velocity.y = 0
		velocity.x = 0

	var motion = velocity * delta
	#move_and_collide(motion)
	var collision_info = move_and_collide(motion)
	
	if(collision_info):
		var collider = collision_info.collider
		emit_signal("chocando", collider)
	else:
		if(motion != Vector2(0,0)):
			emit_signal("caminando")
			
func _ready():
	set_physics_process(true)

