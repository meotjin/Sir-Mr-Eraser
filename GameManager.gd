class_name GameManager

extends Node

var available_attacks := []:
	get:
		return available_attacks

@onready var tile_map: TileMap = $"../TileMap"
@onready var player: Sprite2D = get_tree().get_nodes_in_group("Player")[0]

var player_area := []:
	get:
		return player_area


func find_attacks():
	available_attacks.clear()
	var player_position: Vector2i = tile_map.local_to_map(player.global_position)
	
	var end_tile = Vector2i(player_position.x + 1, player_position.y)
	if tile_map.get_cell_tile_data(0, end_tile).get_custom_data("enemy_can") == true:
		available_attacks.append([player_position, end_tile])
	
	end_tile = Vector2i(player_position.x - 1, player_position.y)
	if tile_map.get_cell_tile_data(0, end_tile).get_custom_data("enemy_can") == true:
		available_attacks.append([player_position, end_tile])
	
	end_tile = Vector2i(player_position.x, player_position.y + 1)
	if tile_map.get_cell_tile_data(0, end_tile).get_custom_data("enemy_can") == true:
		available_attacks.append([player_position, end_tile])
	
	end_tile = Vector2i(player_position.x, player_position.y - 1)
	if tile_map.get_cell_tile_data(0, end_tile).get_custom_data("enemy_can") == true:
		available_attacks.append([player_position, end_tile])


func find_player_area():
	player_area.clear()
	var player_position: Vector2i = tile_map.local_to_map(player.global_position)
	for x in range(-1, 2):
		for y in range(-1, 2):
			player_area.append([player_position, player_position + Vector2i(x,y)])


func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		find_attacks()
		find_player_area()
		print(available_attacks)
		print(player_area)
