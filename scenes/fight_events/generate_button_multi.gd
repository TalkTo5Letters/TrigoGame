extends Button
var drag_preview = preload("res://scenes/fight_events/multiplechoice_drag_preview.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _get_drag_data(at_position):
	var data = {
		"Gyahaha" : 727
	}
	var preview = drag_preview.instantiate()
	preview.text = text
	add_child(preview)

	return data
