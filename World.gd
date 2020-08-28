extends Node2D


func _ready():
	$Player.start($PlayerStart.position)
	$Player.show()
