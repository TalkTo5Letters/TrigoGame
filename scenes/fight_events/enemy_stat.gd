extends Node2D
var hp
var enemy_type = Global.enemy_type
# Called when the node enters the scene tree for the first time.
func _ready():
	match enemy_type:
		1:
			hp = 200
	$ProgressBar.value = hp
	$ProgressBar.max_value = hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
