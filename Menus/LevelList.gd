extends Control

#Preloading the hover and default icons for buttons.
var level1_default_icon = preload("res://Menus/UI_Assets/Buttons/Levels/Level1Active.png")
var level1_hover_icon = preload("res://Menus/UI_Assets/Buttons/Levels/Level1Disabled.png")
var level2_default_icon = preload("res://Menus/UI_Assets/Buttons/Levels/Level2Active.png")
var level2_hover_icon = preload("res://Menus/UI_Assets/Buttons/Levels/Level2Disabled.png")
var level3_default_icon = preload("res://Menus/UI_Assets/Buttons/Levels/Level3Active.png")
var level3_hover_icon = preload("res://Menus/UI_Assets/Buttons/Levels/Level3Disabled.png")
var back_default_icon = preload("res://Menus/UI_Assets/Buttons/BackButton.png")
var back_hover_icon = preload("res://Menus/UI_Assets/Buttons/BackButtonHover.png")

#Preloading the hover and default cursors.
var default_cursor = preload("res://Menus/UI_Assets/Cursor/01.png")
var hover_cursor = preload("res://Menus/UI_Assets/Cursor/02.png")

func _ready():
	#Changed the default cursor appearance.
	Input.set_custom_mouse_cursor(default_cursor)

#New Game Button Actions on default,mouse click and hover states.
func _on_1_pressed():
	get_tree().change_scene_to_file("res://Levels/Level1/level_1.tscn")
func _on_1_button_mouse_entered():
	$Level1.icon = level1_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)
func _on_1_button_mouse_exited():
	$Level1.icon = level1_default_icon
	Input.set_custom_mouse_cursor(default_cursor)

#Settings Button Actions on default,mouse click and hover states.
func _on_2_pressed():
	get_tree().change_scene_to_file("res://Menus/Settings.tscn")
func _on_2_button_mouse_entered():
	$Level2.icon = level2_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)
func _on_2_button_mouse_exited():
	$Level2.icon = level2_default_icon
	Input.set_custom_mouse_cursor(default_cursor)

#Help Button Actions on default,mouse click and hover states.
func _on_3_pressed():
	get_tree().change_scene_to_file("res://Menus/Help.tscn")
func _on_3_button_mouse_entered():
	$Level3.icon = level3_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)
func _on_3_button_mouse_exited():
	$Level3.icon = level3_default_icon
	Input.set_custom_mouse_cursor(default_cursor)

#Exit Button Actions on default ,mouse click and hover states.
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Menus/Main_Menu.tscn")
func _on_back_button_mouse_entered():
	$BackButton.icon = back_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)
func _on_back_button_mouse_exited():
	$BackButton.icon = back_default_icon
	Input.set_custom_mouse_cursor(default_cursor)
