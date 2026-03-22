extends CanvasLayer
const CHAR_READ_RATE = 0.05
@onready var textbox_container = $TextboxContainer
@onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/End
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/RichTextLabel

func text(message, font, waitAfter, decorationsVisible) -> void:
	
	textbox_container.visible = true
	
	start_symbol.visible = decorationsVisible
	end_symbol.visible = decorationsVisible
	
	label.add_theme_font_override("normal_font", font)
	start_symbol.add_theme_font_override("font", font)
	end_symbol.add_theme_font_override("font", font)
	
	label.text = message
	
	for i in range(message.length() + 1):
		label.visible_characters = i
		await get_tree().process_frame
	await get_tree().create_timer(waitAfter).timeout
	textbox_container.visible = false
	
func _ready() -> void:
	textbox_container.visible = false
	#await text("[scary]SINCE WHEN WERE [color=red]YOU[/color] IN CONTROL?[/scary]", load("res://fonts/rawrote.demo.ttf"), 2, false)
	#await text("normal text [scary]scary text[/scary] [color=red]colored text[/color]", load("res://fonts/LexendDecaRegular.ttf"), 2, true)
