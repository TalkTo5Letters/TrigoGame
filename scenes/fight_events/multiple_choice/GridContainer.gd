extends GridContainer

var create_button = preload("res://scenes/fight_events/multiple_choice/generate_button_multi.tscn")  
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_choice_list(data):
	print(data)
	print(data.get("choices").size())
	var choices = data.get("choices")
	var answer = data.get("answer")
	for i in data.get("choices").size():
		var button= create_button.instantiate()
		button.text = choices[i]
		button.answer = answer
		add_child(button)
