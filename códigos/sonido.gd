extends AudioStreamPlayer2D

func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_J:
			play()
