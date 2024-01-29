extends Node2D
var identifier

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact_press():
	print(identifier)
	EventHandler.emit_signal("interact_press", identifier)
