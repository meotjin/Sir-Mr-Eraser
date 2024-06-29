extends Node2D

var nextlevel_default_icon = preload("res://Menus/UI_Assets/Buttons/NextLevelButton.png")
var nextlevel_hover_icon = preload("res://Menus/UI_Assets/Buttons/NextLevelButtonHover.png")
var quit_default_icon = preload("res://Menus/UI_Assets/Buttons/QuitButton.png")
var quit_hover_icon = preload("res://Menus/UI_Assets/Buttons/QuitButtonHover.png")

var default_cursor = preload("res://Menus/UI_Assets/Cursor/01.png")
var hover_cursor = preload("res://Menus/UI_Assets/Cursor/02.png")

func _ready():
	#Changed the default cursor appearance.
	Input.set_custom_mouse_cursor(default_cursor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_level_button_pressed():
	get_tree().change_scene_to_file("res://Menus/LevelList.tscn")


func _on_next_level_button_mouse_entered():
	$NextLevelButton.icon = nextlevel_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)


func _on_next_level_button_mouse_exited():
	$NextLevelButton.icon = nextlevel_default_icon
	Input.set_custom_mouse_cursor(default_cursor)


func _on_quit_button_pressed():
	get_tree().quit()


func _on_quit_button_mouse_entered():
	$QuitButton.icon = quit_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)


func _on_quit_button_mouse_exited():
	$QuitButton.icon = quit_default_icon
	Input.set_custom_mouse_cursor(default_cursor)
