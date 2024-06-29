extends Control

var resume_default_icon = preload("res://Menus/UI_Assets/Buttons/Resume(Pause).png")
var resume_hover_icon = preload("res://Menus/UI_Assets/Buttons/Resume(Pause)Hover.png")
var retry_default_icon = preload("res://Menus/UI_Assets/Buttons/Retry(Pause).png")
var retry_hover_icon = preload("res://Menus/UI_Assets/Buttons/Retry(Pause)Hover.png")
var quit_default_icon = preload("res://Menus/UI_Assets/Buttons/Exit(Pause).png")
var quit_hover_icon = preload("res://Menus/UI_Assets/Buttons/Exit(Pause)Hover.png")

var default_cursor = preload("res://Menus/UI_Assets/Cursor/01.png")
var hover_cursor = preload("res://Menus/UI_Assets/Cursor/02.png")


func _ready():
	#Changed the default cursor appearance.
	Input.set_custom_mouse_cursor(default_cursor)


func _on_resume_button_pressed():
	pass

func _on_resume_button_mouse_entered():
	$ResumeButton.icon = resume_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)


func _on_resume_button_mouse_exited():
	$ResumeButton.icon = resume_default_icon
	Input.set_custom_mouse_cursor(default_cursor)


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
	get_tree().change_scene_to_file("res://Menus/Main_Menu.tscn")


func _on_quit_button_mouse_entered():
	$QuitButton.icon = quit_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)


func _on_quit_button_mouse_exited():
	$QuitButton.icon = quit_default_icon
	Input.set_custom_mouse_cursor(default_cursor)

