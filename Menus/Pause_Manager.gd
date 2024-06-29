extends Node2D

@onready var pause_menu = $PauseMenu
@onready var victory_menu = $VictoryBanner
@onready var defeat_menu = $DefeatBanner
var paused = false
var victory = false
var defeat = false


func _ready():
	pause_menu.hide()
	victory_menu.hide()
	defeat_menu.hide()

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		pause_game()
	if victory:
		victory_banner()
	if defeat:
		defeat_banner()




func pause_game():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused

func victory_banner():
	victory_menu.show()
	Engine.time_scale = 0

func defeat_banner():
	defeat_menu.show()
	Engine.time_scale = 0
