extends Node


func _ready():
	pass


func _on_MainMenu_new_game():
	print_debug('new game emitted and caught in main')
	Global.goto_scene(
		"res://scenes/screens/SchlerpHouse.tscn", 
		"PlayerStart"
	)
