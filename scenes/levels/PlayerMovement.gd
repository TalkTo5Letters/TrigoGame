extends Node2D

var input: String
@onready var Player = $".." #Sets parent's name to Player

func _process(delta): 
	var velocity: float = 250 * delta #4 pixels per second
	input = getInputAndAction(velocity, input) #Calls Input function which calls action funciton, stores last input
	
func getInputAndAction(velocity, input) -> String:
	if Input.is_action_pressed(input): #check if old input is still pressed, if so, calls action immediately
		action(velocity, input)
	else:
		if Input.is_action_pressed("forward"):
			input = "forward"
			action(velocity, input)
		elif Input.is_action_pressed("backward"):
			input = "backward"
			action(velocity, input)
		elif Input.is_action_pressed("left"):
			input = "left"
			action(velocity, input)
		elif Input.is_action_pressed("right"):
			input = "right"
			action(velocity, input)
	return input
	
func action(velocity, input):
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
	else:
		$"..".position.y -= velocity
	
func backward(velocity, sprint):
	if sprint:
		$"..".position.y += velocity * 1.5
	else:
		$"..".position.y += velocity
		
func left(velocity, sprint):
	if sprint:
		$"..".position.x -= velocity * 1.5
	else:
		$"..".position.x -= velocity
		
func right(velocity, sprint):
	if sprint:
		$"..".position.x += velocity * 1.5
	else:
		$"..".position.x += velocity

