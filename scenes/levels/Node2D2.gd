extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_node_2d_dialogue_pop_up():
	var resource = preload("res://Dialogue/level1/Sakura/Fated_Meeting.dialogue")
	DialogueManager.show_dialogue_balloon(resource)
	
	
