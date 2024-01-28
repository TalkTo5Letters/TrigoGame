extends Control
var generator
var data
# Called when the node enters the scene tree for the first time.
func _ready():
	generator = $GridContainer
	generate_field(data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func generate_field(data):
	generator.get_choice_list(data)
