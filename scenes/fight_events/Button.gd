extends Button

func _pressed():
	KillList.level1[Global.current_enemy] = true
	print(KillList.level1.get(Global.current_enemy))
	print(Global.player_current_scene)
	get_tree().change_scene_to_file(Global.player_current_scene)
