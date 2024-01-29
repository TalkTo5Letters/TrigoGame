extends Node2D
var next_level

# Called when the node enters the scene tree for the first time.
func _ready():
	$Interactable.identifier = "level1_0 door"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interactable_interactable_met():
	print("gyahaha")
	var player_position = Vector2.ZERO
	Global.player_level1_pos = player_position
	get_tree().change_scene_to_file("res://scenes/levels/TestScene.tscn")
