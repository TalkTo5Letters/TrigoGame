extends Control
var normal_fight_scene = preload("res://scenes/fight_events/normal_fight_event.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_enemy_1_fight_event():
	Global.player_level1_pos = $"../Player".position
	Global.player_current_scene = get_tree().current_scene.scene_file_path
	get_tree().change_scene_to_file("res://scenes/fight_events/normal_fight_event.tscn")
