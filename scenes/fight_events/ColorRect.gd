extends ColorRect
var dragging: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mous_pos = get_global_mouse_position()
	if dragging && mous_pos[0] <= size[0] && mous_pos[1] <= size[1]:
		color = Color8(255, 255, 255, 40)
	else:
		color = Color8(255, 255, 255, 0)
	pass

func _can_drop_data(at_position, data):
	
	return true

func _drop_data(at_position, data):
	if data.get("text") == data.get("answer"):
		EventHandler.emit_signal("answer_state", true)
		print("correct answer")
	else:
		EventHandler.emit_signal("answer_state", false)
		print("wrong answer")
	pass

func _notification(what):
	match what:
		NOTIFICATION_DRAG_BEGIN:
			dragging = true
		NOTIFICATION_DRAG_END:
			dragging = false
