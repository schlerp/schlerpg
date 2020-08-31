extends Node2D


func _ready():
	Global.player.start($PlayerStart.position)
	Global.player.show()

