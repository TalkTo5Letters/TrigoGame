extends GridContainer

var create_button = preload("res://scenes/fight_events/generate_button_multi.tscn")  
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_choice_list(arr):
	for i in arr.size():
		var button= create_button.instantiate()
		button.text = arr[i]
		add_child(button)
