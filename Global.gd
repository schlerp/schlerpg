extends Node


var current_scene = null
var player = null
var hud = null


func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)


func goto_scene(path, start_location):
	call_deferred("_deferred_goto_scene", path, start_location)


func _deferred_goto_scene(path, _start_location):
	# It is now safe to remove the current scene
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)
	hud = ResourceLoader.load("res://scenes/huds/HUD.tscn").instance()
	player = ResourceLoader.load("res://characters/Player.tscn").instance()
	
	# Instance the new scene.
	current_scene = s.instance()
	
	# inject the global player/hud
	inject_globals()

	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)


func inject_globals():
	# check if scene has hud placeholder, replace with global hud
	if current_scene.has_node('HUD'):
		print_debug('replaced HUD')
		current_scene.get_node('HUD').replace_by(hud)
	
	# check if scene has player placeholder, replace with global player
	if current_scene.has_node('Player'):
		print_debug('replaced Player')
		current_scene.get_node('Player').replace_by(player)
	
	elif current_scene.has_node('YSort/Player'):
		print_debug('replaced Player')
		current_scene.get_node('YSort/Player').replace_by(player)


func set_camera(left, right, top, bottom):
	player.get_node('Camera2D').limit_left = left
	player.get_node('Camera2D').limit_right = right
	player.get_node('Camera2D').limit_top = top
	player.get_node('Camera2D').limit_bottom = bottom

