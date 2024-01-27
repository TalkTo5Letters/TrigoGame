extends Button
var droppable_area_vis = preload("res://scenes/fight_events/create_droppable_area.tscn").instantiate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	droppable_area_vis.visible = true
	if Input.is_action_just_released("left_mouse"):
		queue_free()
