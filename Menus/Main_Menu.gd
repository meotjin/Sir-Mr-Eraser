extends Control

#Preloading the hover and default icons for buttons.
var newgame_default_icon = preload("res://Menus/UI_Assets/Buttons/NewGameButton.png")
var newgame_hover_icon = preload("res://Menus/UI_Assets/Buttons/NewGameButtonHoover.png")
var settings_default_icon = preload("res://Menus/UI_Assets/Buttons/SettingsButton.png")
var settings_hover_icon = preload("res://Menus/UI_Assets/Buttons/SettingsButtonHoover.png")
var help_default_icon = preload("res://Menus/UI_Assets/Buttons/HelpButton.png")
var help_hover_icon = preload("res://Menus/UI_Assets/Buttons/HelpButtonHoover.png")
var exit_default_icon = preload("res://Menus/UI_Assets/Buttons/ExitButton.png")
var exit_hover_icon = preload("res://Menus/UI_Assets/Buttons/ExitButtonHoover.png")

#Preloading the hover and default cursors.
var default_cursor = preload("res://Menus/UI_Assets/Cursor/01.png")
var hover_cursor = preload("res://Menus/UI_Assets/Cursor/02.png")

func _ready():
	#Changed the default cursor appearance.
	Input.set_custom_mouse_cursor(default_cursor)

#New Game Button Actions on default,mouse click and hover states.
func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Levels/Level1/level_1.tscn")
func _on_new_game_button_mouse_entered():
	$NewGameButton.icon = newgame_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)
func _on_new_game_button_mouse_exited():
	$NewGameButton.icon = newgame_default_icon
	Input.set_custom_mouse_cursor(default_cursor)

#Settings Button Actions on default,mouse click and hover states.
func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Menus/Settings.tscn")
func _on_settings_button_mouse_entered():
	$SettingsButton.icon = settings_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)
func _on_settings_button_mouse_exited():
	$SettingsButton.icon = settings_default_icon
	Input.set_custom_mouse_cursor(default_cursor)

#Help Button Actions on default,mouse click and hover states.
func _on_help_pressed():
	get_tree().change_scene_to_file("res://Menus/Help.tscn")
func _on_help_button_mouse_entered():
	$HelpButton.icon = help_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)
func _on_help_button_mouse_exited():
	$HelpButton.icon = help_default_icon
	Input.set_custom_mouse_cursor(default_cursor)

#Exit Button Actions on default ,mouse click and hover states.
func _on_exit_pressed():
	get_tree().quit()
func _on_exit_button_mouse_entered():
	$ExitButton.icon = exit_hover_icon
	Input.set_custom_mouse_cursor(hover_cursor)
func _on_exit_button_mouse_exited():
	$ExitButton.icon = exit_default_icon
	Input.set_custom_mouse_cursor(default_cursor)

