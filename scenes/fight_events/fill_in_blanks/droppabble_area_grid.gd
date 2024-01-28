extends GridContainer

var data
var droppable_area = preload("res://scenes/fight_events/fill_in_blanks/droppable_area.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	generate_droppable()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func generate_droppable():
	print(data)
	var answer = data.get("answer")
	print(answer)
	for i in answer:
		var area = droppable_area.instantiate()
		droppable_area.identifier = i
		add_child(area)
		
