extends Node2D
@onready var _animated_sprite = $"../AnimatedSprite2D"

var velocity:Vector2
@onready var Player = $".." #Sets parent's name to Player
@export var speed:int = 12500

var input_buffer = [Vector2.ZERO]
var input_buffer_readout = Vector2()

func _physics_process(delta):
	if Input.is_action_just_pressed("right"):
		input_buffer.append(Vector2.RIGHT)
	elif Input.is_action_just_pressed("left"):
		input_buffer.append(Vector2.LEFT)
	elif Input.is_action_just_pressed("forward"):
		input_buffer.append(Vector2.UP)
	elif Input.is_action_just_pressed("backward"):
		input_buffer.append(Vector2.DOWN)

	if Input.is_action_just_released("right"):
		input_buffer.erase(Vector2.RIGHT)
	elif Input.is_action_just_released("left"):
		input_buffer.erase(Vector2.LEFT)
	elif Input.is_action_just_released("forward"):
		input_buffer.erase(Vector2.UP)
	elif Input.is_action_just_released("backward"):
		input_buffer.erase(Vector2.DOWN)

	input_buffer_readout = input_buffer[-1]
	
	match str(input_buffer_readout):
		"(0, -1)":
			_animated_sprite.play("move_up")
		"(0, 1)":
			_animated_sprite.play("move_down")
		"(1, 0)":
			_animated_sprite.play("move_right")
		"(-1, 0)":
			_animated_sprite.play("move_left")
			
	if input_buffer_readout.x + input_buffer_readout.y == 0: _animated_sprite.stop()
	if Input.is_action_pressed("sprint"): 
		_animated_sprite.set_speed_scale(1.5)
		Player.velocity = input_buffer_readout * speed * delta * 1.5
		Player.move_and_slide()
	else:
		_animated_sprite.set_speed_scale(1)
		Player.velocity = input_buffer_readout * speed * delta
		Player.move_and_slide()