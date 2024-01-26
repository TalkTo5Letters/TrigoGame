extends Node2D
@onready var _animated_sprite = $"../AnimatedSprite2D"

var input: String
var velocity:Vector2
@onready var Player = $".." #Sets parent's name to Player

func _process(delta): 
	var speed: int = 12000 * delta #4 pixels per second
	input = getInputAndAction(speed) #Calls Input function which calls action funciton, stores last input
	
func getInputAndAction(speed) -> String:
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
		else: action(speed)
	else:
		_animated_sprite.stop()
	return input

func action(speed):
	match input:
		"forward":
			velocity = Vector2(0, -speed)
			forward(Input.is_action_pressed("sprint"))
		"backward":
			velocity = Vector2(0, speed)
			backward(Input.is_action_pressed("sprint"))
		"left":
			velocity = Vector2(-speed, 0)
			left(Input.is_action_pressed("sprint"))
		"right":
			velocity = Vector2(speed, 0)
			right(Input.is_action_pressed("sprint"))
	print(velocity)
		
func forward(sprint):
	if sprint:
		Player.velocity = velocity * 1.5
		Player.move_and_slide()
		_animated_sprite.play("move_up")
	else:
		Player.velocity = velocity
		Player.move_and_slide()
		_animated_sprite.set_speed_scale(1)
		_animated_sprite.play("move_up")
	
func backward(sprint):
	if sprint:
		Player.velocity = velocity * 1.5
		Player.move_and_slide()
		_animated_sprite.set_speed_scale(1.5)
		_animated_sprite.play("move_down")
	else:
		Player.velocity = velocity
		Player.move_and_slide()
		_animated_sprite.play("move_down")
		
func left(sprint):
	if sprint:
		Player.velocity = velocity * 1.5
		Player.move_and_slide()
		_animated_sprite.set_speed_scale(1.5)
		_animated_sprite.play("move_left")
	else:
		Player.velocity = velocity
		Player.move_and_slide()
		_animated_sprite.set_speed_scale(1)
		_animated_sprite.play("move_left")
		
func right(sprint):
	if sprint:
		Player.velocity = velocity * 1.5
		Player.move_and_slide()
		_animated_sprite.set_speed_scale(1.5)
		_animated_sprite.play("move_right")
	else:
		Player.velocity = velocity
		Player.move_and_slide()
		_animated_sprite.set_speed_scale(1)
		_animated_sprite.play("move_right")

