extends Control

var back_default_icon = preload("res://Menus/UI_Assets/Buttons/BackButton.png")
var back_hover_icon = preload("res://Menus/UI_Assets/Buttons/BackButtonHover.png")

var default_cursor = preload("res://Menus/UI_Assets/Cursor/01.png")
var hover_cursor = preload("res://Menus/UI_Assets/Cursor/02.png")

func _ready():
	#Changed the default cursor appearance.
	Input.set_custom_mouse_cursor(default_cursor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Menus/Main_Menu.tscn")


func _on_back_button_mouse_entered():
	$BackButton.icon = back_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)


func _on_back_button_mouse_exited():
	$BackButton.icon = back_default_icon
	Input.set_custom_mouse_cursor(default_cursor)

