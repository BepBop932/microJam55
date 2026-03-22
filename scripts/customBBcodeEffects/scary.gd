@tool
extends RichTextEffect
class_name scary

#this is a bbcode tag called "scary" that shakes text
var bbcode = "scary"
var rng = RandomNumberGenerator.new()
func _process_custom_fx(char_fx: CharFXTransform):
	char_fx.offset.y = rng.randf_range(-5,5)
	char_fx.offset.x = rng.randf_range(-5,5)
	pass
