extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var frontDoor = $frontDoor/Area2D
	frontDoor.connect("frontToKitchen", Callable(self, "_swap"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _swap(path):
	var old = $frontDoor
	old.queue_free()
	
	var new_scene = load(path).instantiate()
	add_child(new_scene)
