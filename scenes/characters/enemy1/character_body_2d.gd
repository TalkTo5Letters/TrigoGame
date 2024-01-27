extends CharacterBody2D
var current_enemy_type = 1
signal fight_event(enemy_type)
var enemy_name = "enemy1"

func _ready():
	if is_in_group("killed"):
		queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		print(KillList.level1.get(enemy_name))
		if KillList.level1.get(enemy_name) == false:
			Global.enemy_type = current_enemy_type
			Global.current_enemy = enemy_name
			fight_event.emit()
		else:
			queue_free()
		
