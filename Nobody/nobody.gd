extends Sprite2D

@onready var tile_map = $"../TileMap"
@onready var sprite = $Sprite2D

var is_moving = false

func _physics_process(delta):
	if is_moving == false:
		return
	if global_position == sprite.global_position:
		is_moving = false
		return
	
	sprite.global_position = sprite.global_position.move_toward(global_position,2)

func _process(delta):
	detect_input()


func detect_input():
	var direction: Vector2 = Input.get_vector("left","right","up","down")
	if is_moving == true:
		return
	
	move(direction)


func move(dir: Vector2):
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	var target_tile: Vector2i = Vector2i(
		current_tile.x + dir.x,
		current_tile.y + dir.y
	)
	
	var tile_data: TileData = tile_map.get_cell_tile_data(0, target_tile)
	if tile_data.get_custom_data("walkable") == false:
		return
	
	is_moving = true;
	global_position = tile_map.map_to_local(target_tile)
	sprite.global_position = tile_map.map_to_local(current_tile)
