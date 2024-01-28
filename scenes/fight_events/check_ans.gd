extends Node2D
var emitter
var quest_data
# Called when the node enters the scene tree for the first time.
func _ready():
	emitter = get_node("/root/EventHandler")
	emitter.answer_state.connect(check_answer_state.bind())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func check_answer_state(state):
	var damage = int(quest_data.get("damage"))
	if state == true:
		print($"../enemy_stat/ProgressBar".value )
		$"../enemy_stat/ProgressBar".value -= damage
		if $"../enemy_stat/ProgressBar".value <= 0:
			kill_enemy()
			return
	if state == false:
		print("wrong")
	$"..".reload()

func kill_enemy():
	$"../Label".text = "Enemy Killed!"
	await get_tree().create_timer(5).timeout
	KillList.level1[Global.current_enemy] = true
	print(KillList.level1.get(Global.current_enemy))
	print(Global.player_current_scene)
	get_tree().change_scene_to_file(Global.player_current_scene)
