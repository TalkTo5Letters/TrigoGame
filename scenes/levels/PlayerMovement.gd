extends Node2D
@onready var _animated_sprite = $"../CharacterBody2D/AnimatedSprite2D"

var input: String
@onready var Player = $".." #Sets parent's name to Player

func _process(delta): 
	var velocity: float = 250 * delta #4 pixels per second
	input = getInputAndAction(velocity) #Calls Input function which calls action funciton, stores last input
	print(input)

func getInputAndAction(velocity) -> String:
	if Input.is_action_just_pressed("forward"):
		input = "forward"
	elif Input.is_action_just_pressed("backward"):
		input = "backward"
	elif Input.is_action_just_pressed("left"):
		input = "left"
	elif Input.is_action_just_pressed("right"):
		input = "right"
		
	if input != "":
		if !Input.is_action_pressed(input): input = ""
		else: action(velocity)
	else:
		_animated_sprite.stop()
	return input

func action(velocity):
	match input:
		"forward":
			forward(velocity, Input.is_action_pressed("sprint"))
		"backward":
			backward(velocity, Input.is_action_pressed("sprint"))
		"left":
			left(velocity, Input.is_action_pressed("sprint"))
		"right":
			right(velocity, Input.is_action_pressed("sprint"))
		
func forward(velocity, sprint):
	if sprint:
		Player.position.y -= velocity * 1.5
		_animated_sprite.set_speed_scale(1.5)
		_animated_sprite.play("move_up")
	else:
		Player.position.y -= velocity
		_animated_sprite.set_speed_scale(1)
		_animated_sprite.play("move_up")
	
func backward(velocity, sprint):
	if sprint:
		Player.position.y += velocity * 1.5
		_animated_sprite.set_speed_scale(1.5)
		_animated_sprite.play("move_down")
	else:
		Player.position.y += velocity
		_animated_sprite.play("move_down")
		
func left(velocity, sprint):
	if sprint:
		Player.position.x -= velocity * 1.5
		_animated_sprite.set_speed_scale(1.5)
		_animated_sprite.play("move_left")
	else:
		Player.position.x -= velocity
		_animated_sprite.set_speed_scale(1)
		_animated_sprite.play("move_left")
		
func right(velocity, sprint):
	if sprint:
		Player.position.x += velocity * 1.5
		_animated_sprite.set_speed_scale(1.5)
		_animated_sprite.play("move_right")
	else:
		Player.position.x += velocity
		_animated_sprite.set_speed_scale(1)
		_animated_sprite.play("move_right")

