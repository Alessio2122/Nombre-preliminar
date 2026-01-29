extends CharacterBody2D

# Velocidad de movimiento en píxeles por segundo
@export var speed : float = 600.0

func _physics_process(_delta):
	# Dirección horizontal (-1 a 1)
	var dir_x = Input.get_axis("ui_left", "ui_right")
	# Dirección vertical (-1 a 1)
	var dir_y = Input.get_axis("ui_up", "ui_down")
	
	# Movimiento horizontal
	if dir_x != 0:
		velocity.x = dir_x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	# Movimiento vertical
	if dir_y != 0:
		velocity.y = dir_y * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	
	# Mueve al personaje
	move_and_slide()
