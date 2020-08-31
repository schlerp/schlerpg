extends Control

signal new_game
#signal load_game
#signal settings

func _ready():
	pass


func _on_NewGameButton_pressed():
	print_debug('New Game Selected')
	emit_signal("new_game")

