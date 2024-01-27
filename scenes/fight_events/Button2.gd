extends Button

func _pressed():
	$"..".generate_question(Global.enemy_type)
