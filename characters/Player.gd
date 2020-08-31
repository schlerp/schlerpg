extends KinematicBody2D

# movement constants
const ACCEL = 100
const MAX_SPEED = 200
const FRICTION = 100

# movement variables
var velocity = Vector2.ZERO


func _ready():
	pass

func _physics_process(_delta):
	var input_vector = Vector2.ZERO
	
	# get input
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	# handle the acceleration and friction
	if input_vector == Vector2.ZERO:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	else:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCEL)
		velocity = velocity.clamped(MAX_SPEED)

	# do the movement
	velocity = move_and_slide(velocity)


func _process(_delta):
	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()

	if velocity.x != 0:
		if velocity.x > 0:
			$AnimatedSprite.animation = "walk right"
		if velocity.x < 0:
			$AnimatedSprite.animation = "walk left"
	elif velocity.y != 0:
		if velocity.y > 0:
			$AnimatedSprite.animation = "walk down"
		if velocity.y < 0:
			$AnimatedSprite.animation = "walk up"
	
	if Input.is_action_just_pressed('ui_select'):
		Global.hud.toggle_overlay()


func start(pos):
	position = pos
	show()

