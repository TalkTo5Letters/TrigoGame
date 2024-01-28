extends GridContainer
var data
var create_button = preload("res://scenes/fight_events/fill_in_blanks/button_gen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	generate_button()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func generate_button():
	print(data)
	var choices = data.get("choices")
	var answer = data.get("answer")
	print(choices)
	for i in choices:
		var button = create_button.instantiate()
		button.text = i
		button.answer = answer
		add_child(button)
		
