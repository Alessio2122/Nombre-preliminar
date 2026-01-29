extends CharacterBody2D

@export var max_speed : float = 600.0
@export var acceleration : float = 2000.0
@export var friction : float = 2000.0

func _physics_process(delta):
	# 1. Leer input (valores entre -1 y 1)
	var input_dir = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)

	# 2. Normalizar para que no corra más en diagonal
	if input_dir != Vector2.ZERO:
		input_dir = input_dir.normalized()

	# 3. Aplicar aceleración o freno
	if input_dir != Vector2.ZERO:
		velocity = velocity.move_toward(input_dir * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	# 4. Mover el personaje
	move_and_slide()
