extends Node
var animation_tree 
var state_machine
var animation_player

func _ready():
	animation_player = $"../AnimationPlayer"
	animation_tree = $"../AnimationTree" 
	state_machine = animation_tree.get("parameters/playback")
	update_animation_parameters(Vector2(0,1), false)
	EventHandler.interactable.connect(interact_notif_show.bind())
	EventHandler.interactable_end.connect(interact_notif_hide)
	
func update_animation_parameters(move_input : Vector2, sprint: bool):
	if(move_input != Vector2.ZERO):
		if sprint:
			animation_tree.set("parameters/BlendTree/TimeScale/scale", 2)
			animation_tree.set("parameters/Idle/blend_position", move_input)
			animation_tree.set("parameters/BlendTree/Walk/blend_position", move_input)
		else:
			animation_tree.set("parameters/BlendTree/TimeScale/scale", 1)
			animation_tree.set("parameters/Idle/blend_position", move_input)
			animation_tree.set("parameters/BlendTree/Walk/blend_position", move_input)

func state_machine_state(input_buffer_readout):
	if(input_buffer_readout != Vector2.ZERO):
		state_machine.travel("BlendTree")
	else:
		state_machine.travel("Idle")

func interact_notif_show(identifier):
	$"../PlayerInput".identifier = identifier
	$"../InteractableSprite".visible = true

func interact_notif_hide():
	$"../PlayerInput".identifier = "none"
	$"../InteractableSprite".visible = false
