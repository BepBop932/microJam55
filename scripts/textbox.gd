extends CanvasLayer

const CHAR_READ_RATE = 0.05

@onready var textbox_container = $TextboxContainer
@onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/End
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label

func text(message, color, font) -> void:
	
	label.add_theme_font_override("font", font)
	start_symbol.add_theme_font_override("font", font)
	end_symbol.add_theme_font_override("font", font)
	
	
	start_symbol.add_theme_color_override("font_color", color)
	label.add_theme_color_override("font_color", color)
	end_symbol.add_theme_color_override("font_color", color)
	
	for i in range(message.length() + 1):
		label.text = message.left(i)
		await get_tree().process_frame
	
func _ready() -> void:
	text("normal text test, this is boring normal text boring booooooooooooooooooooooooo", Color(1,1,1), load("res://fonts/LexendDecaRegular.ttf"))
	await get_tree().create_timer(5).timeout
	text("scary text test, ooh so scary so cool so scary AHHHHHHHHHHHHHHHHHHHHHHHHH", Color(0.6,0.2,0.2), load("res://fonts/rawrote.demo.ttf"))
	
