extends PointLight2D
var lightToggle = true
var cd = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	enabled = lightToggle


func _input(event: InputEvent) -> void:
	if cd == false:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			lightToggle = not lightToggle
			cd = true
			get_tree().create_timer(0.1).timeout.connect(func(): cd = false)
		
