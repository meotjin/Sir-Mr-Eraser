extends Sprite2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var Player: Sprite2D = get_tree().get_nodes_in_group("Player")[0]
@onready var timer = $"../BeatIndicator"
@onready var moving = false
@onready var tile_map: TileMap = $"../TileMap"
var direction: Vector2i
var move_dir: Vector2i


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
	).sign()
	
	if direction.x != 0:
		move_dir = Vector2i(direction.x, 0)
	elif direction.y != 0:
		move_dir = Vector2i(0, direction.y)
	else:
		move_dir = Vector2.ZERO


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
