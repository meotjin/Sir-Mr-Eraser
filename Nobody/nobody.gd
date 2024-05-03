#----------------------------------
# Coded by Kurosh Hesamshariati
#----------------------------------
# thanks to Retrobright Youtube Channel for their Idea

extends Sprite2D

@onready var tile_map = $"../TileMap"
@onready var sprite = $Sprite2D
@onready var timer = $"../BeatIndicator"

# will not let the character move towards destination unless command is given
var move_command = false; 

var take_input = true

func _ready():
	timer.everyone_move.connect(command_move)

func _physics_process(delta):
	# will let new commands to be given once the previous is done
	if global_position == sprite.global_position:
		move_command = false
		take_input = true
		return
	# moving
	if move_command == true:
		sprite.global_position = sprite.global_position.move_toward(global_position,2)


func _process(delta):
	detect_input()


func detect_input():
	if not take_input:
		return
	#if Input.is_action_just_pressed("move"):
		#move_command = true;
		#return

	var direction: Vector2 = Input.get_vector("left","right","up","down")
	
	if direction != Vector2.ZERO:
		move(direction)


func move(dir: Vector2):
	# reseting the position of the cursor
	global_position = sprite.global_position
	
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	var target_tile: Vector2i = Vector2i(
		current_tile.x + dir.x,
		current_tile.y + dir.y
	)
	
	# i have declared a custom data layer on the Tilemap, setting some tiles 
	# as walkable tiles. the character may only enter those tiles
	var tile_data: TileData = tile_map.get_cell_tile_data(0, target_tile)
	if tile_data.get_custom_data("walkable") == false:
		return
	
	global_position = tile_map.map_to_local(target_tile)
	sprite.global_position = tile_map.map_to_local(current_tile)


func command_move():
	take_input = false
	move_command = true
