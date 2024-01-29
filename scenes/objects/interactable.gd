extends Node2D
var identifier
signal interactable_met
# Called when the node enters the scene tree for the first time.
func _ready():
	EventHandler.interact_press.connect(interact_call.bind())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		EventHandler.emit_signal("interactable", identifier)


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		EventHandler.emit_signal("interactable_end")

func interact_call(received_identifier):
	print(received_identifier)
	if received_identifier == identifier:
		interactable_met.emit()
