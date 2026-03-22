@tool
extends RichTextEffect
class_name fun


#this is bbcode tag called "fun", which makes the text bounce up and down
var bbcode = "fun"
func _process_custom_fx(char_fx: CharFXTransform):
	char_fx.offset.y = 5 * sin(char_fx.elapsed_time * 60 + char_fx.relative_index)
	pass
