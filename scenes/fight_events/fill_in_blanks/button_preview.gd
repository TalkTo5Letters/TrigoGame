extends Button

func _ready():
	set_mouse_filter(2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	if Input.is_action_just_released("left_mouse"):
		queue_free()
