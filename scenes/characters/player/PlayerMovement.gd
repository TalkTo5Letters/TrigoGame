extends Node2D
var Player
var speed: int
var input_buffer
var input_buffer_readout
var Player_Animation

func _ready():
	Player_Animation = $"../PlayerAnimation"
	Player = $".." #Sets parent's name to Player
	speed = 6500
	input_buffer = [Vector2.ZERO]
	input_buffer_readout = Vector2()

func _physics_process(delta):
	#checks for keypresses, if found, append to bufferc
	if Input.is_action_just_pressed("right"):
		input_buffer.append(Vector2.RIGHT)
	elif Input.is_action_just_pressed("left"):
		input_buffer.append(Vector2.LEFT)
	elif Input.is_action_just_pressed("forward"):
		input_buffer.append(Vector2.UP)
	elif Input.is_action_just_pressed("backward"):
		input_buffer.append(Vector2.DOWN)

#cancer, checks if any control is not pressed, if it's not, delete it from buffer
	if !Input.is_action_pressed("right"):
		input_buffer.erase(Vector2.RIGHT)
	if !Input.is_action_pressed("left"):
		input_buffer.erase(Vector2.LEFT)
	if !Input.is_action_pressed("forward"):
		input_buffer.erase(Vector2.UP)
	if !Input.is_action_pressed("backward"):
		input_buffer.erase(Vector2.DOWN)

	input_buffer_readout = input_buffer[-1]
			
	if Input.is_action_pressed("sprint"): 
		Player.velocity = input_buffer_readout * speed * delta * 1.5
		Player.move_and_slide()
	else:
		Player.velocity = input_buffer_readout * speed * delta
		Player.move_and_slide()
	
	Player_Animation.update_animation_parameters(input_buffer_readout, Input.is_action_pressed("sprint"))
	Player_Animation.state_machine_state(input_buffer_readout)
	if Input.is_action_just_pressed("Interact"):
		$"../PlayerInput".interact_press()
