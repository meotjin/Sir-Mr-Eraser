extends Sprite2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var Player: Sprite2D = get_tree().get_nodes_in_group("Player")[0]
@onready var timer = $"../BeatIndicator"
@onready var moving = false
@onready var tile_map: TileMap = $"../TileMap"
var direction: Vector2i
var move_dir: Vector2i
var is_far: bool = false


func _ready():
	timer.everyone_move.connect(chase_player)
	find_move()


func _physics_process(delta):
	if global_position == sprite.global_position:
		moving = false
		return
	
	if moving:
		sprite.global_position = sprite.global_position.move_toward(global_position, 2)


func find_move():
	direction = Vector2i(
		Player.global_position.x - global_position.x,
		Player.global_position.y - global_position.y
	)

	if direction.x != 0:
		move_dir = Vector2i(direction.sign().x, 0)
	elif direction.y != 0:
		move_dir = Vector2i(0, direction.sign().y)
	else:
		move_dir = Vector2i.ZERO
	
	var how_far_y = abs(tile_map.local_to_map(Player.global_position).y -\
	 tile_map.local_to_map(global_position).y)
	var how_far_x = abs(tile_map.local_to_map(Player.global_position).x -\
	 tile_map.local_to_map(global_position).x)
	
	if move_dir.x && how_far_x >= 2:
		is_far = true
		print("yaay")
	elif move_dir.y && how_far_y >= 2:
		is_far = true
	else:
		is_far = false
	
	print(is_far)
	
	if is_far:
		move_dir *= 2


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
	moving = true
	find_move()
