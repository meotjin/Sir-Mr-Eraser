class_name GameManager

extends Node

var available_attacks := []:
	get:
		return available_attacks

@onready var tile_map: TileMap = $"../TileMap"
@onready var player: Sprite2D = get_tree().get_first_node_in_group("Player")
@onready var timer = $"../BeatIndicator"

var player_area := []:
	get:
		return player_area

func _ready():
	timer.everyone_move.connect(func():
		find_player_area()
		find_attacks()
		print(player_area)
		print(available_attacks)
	)

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
			player_area.append(player_position + Vector2i(x,y))
