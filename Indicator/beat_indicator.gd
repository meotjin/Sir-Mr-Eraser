extends Node

signal everyone_move


func _on_timer_timeout():
	everyone_move.emit()
