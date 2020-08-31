extends Node2D


const left = -128
const right = 1152
const top = -128
const bottom = 704


func _ready():
	Global.player.start($PlayerStart.position)
	Global.player.show()
	Global.set_camera(left, right, top, bottom)

func _on_Door_body_entered(body):
	#if body == get_node("YSort/Player"):
	if body == Global.player:
		print_debug('SchlerpHouse Door entered!')
		Global.goto_scene(
			"res://scenes/screens/SchlerpHouseInside.tscn",
			"PlayerStart"
		)


func _on_ExitNorth_body_entered(body):
	if body == get_node("YSort/Player"):
		print_debug('ExitNorth entered!')
		#Global.goto_scene(
		#	"res://scenes/screens/SchlerpHouseInside.tscn",
		#	"PlayerStart"
		#)
