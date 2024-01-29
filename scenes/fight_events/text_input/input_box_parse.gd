extends Control
var data

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_line_edit_text_submitted(new_text):
	print(new_text)
	print(data.get("answer"))
	if data.get("answer") == new_text:
		EventHandler.emit_signal("answer_state", true)
	else:
		EventHandler.emit_signal("answer_state", false)
