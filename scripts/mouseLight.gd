extends PointLight2D

var lightToggle = true
var cd = false

var timeToDo = 0.075
var timeUp = 0.0

func _ready() -> void:
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timeUp += delta
	if timeUp >= timeToDo:
		# flicker
		energy = randf_range(0.95,1.05)
		timeUp = 0
	
	#global_position = get_global_mouse_position()
	var pos = create_tween()
	pos.tween_property(self,"position", get_global_mouse_position(), 0.2)
	
	enabled = lightToggle

func _input(event: InputEvent) -> void:
	if cd == false:
		if Input.is_action_just_pressed("click"):
			lightToggle = not lightToggle
			cd = true
			get_tree().create_timer(0.1).timeout.connect(func(): cd = false)
		
