extends Area2D
signal frontToKitchen

func _mouse_enter() -> void:
	emit_signal("frontToKitchen", "res://kitchen.tscn")
