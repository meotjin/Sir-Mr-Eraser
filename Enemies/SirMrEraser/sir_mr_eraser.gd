extends Sprite2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var Player: Sprite2D = get_tree().get_first_node_in_group("Player")
@onready var timer = $"../BeatIndicator"
@onready var moving = false
@onready var tile_map: TileMap = $"../TileMap"
@onready var game_manager: GameManager = $"../GameManager"

var direction: Vector2i
var move_dir: Vector2i
var move_tiles: Array
var is_far: bool = false


func _ready():
	timer.everyone_move.connect(func(): 
		moving = true
	)
	find_move()


func _physics_process(delta):
	if global_position == sprite.global_position:
		moving = false
		for tile in move_tiles:
			tile_map.set_cell(0, tile, 0, Vector2i(0, 40))
		move_tiles.clear()
		var current: Vector2i = tile_map.local_to_map(sprite.global_position)
		if game_manager.player_area.has(current):
			print("coolcool")
		find_move()
		return
	
	if moving:
		sprite.global_position = sprite.global_position.move_toward(global_position, 2)


func find_move():
	direction = Vector2i(
		Player.global_position.x - global_position.x,
		Player.global_position.y - global_position.y
	)
	#print(direction)
	if direction.x != 0 && abs(direction.x) >= abs(direction.y):
		move_dir = Vector2i(direction.sign().x, 0)
	elif direction.y != 0 && abs(direction.y) >= abs(direction.x):
		move_dir = Vector2i(0, direction.sign().y)
	else:
		move_dir = Vector2i.ZERO
	
	move_dir *= 2
	
	chase_player()


func chase_player():
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	var target_tile: Vector2i = Vector2i(
		current_tile.x + move_dir.x,
		current_tile.y + move_dir.y
	)
	
	var tile_data: TileData = tile_map.get_cell_tile_data(0, target_tile)
	if tile_data.get_custom_data("enemy_can") == false:
		return
	
	global_position = tile_map.map_to_local(target_tile)
	sprite.global_position = tile_map.map_to_local(current_tile)
	
	move_tiles.append(target_tile)
	move_tiles.append(Vector2i(ceil((target_tile.x + current_tile.x) / 2),\
	ceil((target_tile.y + current_tile.y) / 2)))
	
	for tile in move_tiles:
		tile_map.set_cell(0, tile, 0, Vector2i(2, 40))
