extends Node2D
var Player
@export var speed: int
var input_buffer
var input_buffer_readout
var Player_Animation

func _ready():
	Player_Animation = $"../PlayerAnimation"
	Player = $".." #Sets parent's name to Player
	input_buffer = [Vector2.ZERO]
	input_buffer_readout = Vector2()

func _physics_process(delta):
	#gravity my nigga 
	if not Player.is_on_floor():
		input_buffer.append(Vector2.DOWN)
		print("nigga")
	else:
		input_buffer.erase(Vector2.DOWN)
		print("happy nigga")
		
	#checks for keypresses, if found, append to bufferc
	if Input.is_action_just_pressed("right"):
		input_buffer.append(Vector2.RIGHT)
	elif Input.is_action_just_pressed("left"):
		input_buffer.append(Vector2.LEFT)

#cancer, checks if any control is not pressed, if it's not, delete it from buffer
	if !Input.is_action_pressed("right"):
		input_buffer.erase(Vector2.RIGHT)
	if !Input.is_action_pressed("left"):
		input_buffer.erase(Vector2.LEFT)
		
	input_buffer_readout = input_buffer[-1]
			
	if Input.is_action_pressed("sprint"): 
		Player.velocity = input_buffer_readout * speed * delta * 1.5
		Player.move_and_slide()
	else:
		Player.velocity = input_buffer_readout * speed * delta
		Player.move_and_slide()
	
	Player_Animation.update_animation_parameters(input_buffer_readout, Input.is_action_pressed("sprint"))
	Player_Animation.state_machine_state(input_buffer_readout)
