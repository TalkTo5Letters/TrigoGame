extends Node
var fight_event
var fight_event_scene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_1_fight_event(enemy_type):
	print(enemy_type)
	fight_event_scene = preload("res://scenes/fight_events/normal_fight_event.tscn")
	fight_event = fight_event_scene.instantiate() # Replace with function body.
	fight_event.enemy_type = enemy_type
	add_child(fight_event)
