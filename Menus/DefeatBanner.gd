extends Node2D

var retry_default_icon = preload("res://Menus/UI_Assets/Buttons/RetryButton.png")
var retry_hover_icon = preload("res://Menus/UI_Assets/Buttons/RetryButtonHover.png")
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


func _on_retry_button_pressed():
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_retry_button_mouse_entered():
	$RetryButton.icon = retry_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)


func _on_retry_button_mouse_exited():
	$RetryButton.icon = retry_default_icon
	Input.set_custom_mouse_cursor(default_cursor)


func _on_quit_button_pressed():
	get_tree().quit()


func _on_quit_button_mouse_entered():
	$QuitButton.icon = quit_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)


func _on_quit_button_mouse_exited():
	$QuitButton.icon = quit_default_icon
	Input.set_custom_mouse_cursor(default_cursor)
