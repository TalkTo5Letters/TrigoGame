extends Control
var quest_gen
var multi_choice_gen_scene
# Called when the node enters the scene tree for the first time.
func _ready():
	quest_gen = $QuestionGenerator
	multi_choice_gen_scene = preload("res://scenes/fight_events/collision_placeholder.tscn")
	generate_question(Global.enemy_type)


# Called every frame. 'delta' is the elapsed time since the predvious frame.
func _process(delta):
	pass

func generate_question(enemy_type):
	var quest_data = quest_gen.get_question(enemy_type)
	print(quest_data)
	var quest_type = quest_data.get("type")
	var choices = quest_data.get("choices")
	$Label.text = quest_data.get("question")
	print(choices)
	match quest_type:
		1:
			var multi_choice_gen = multi_choice_gen_scene.instantiate()
			multi_choice_gen.arr = choices
			add_child(multi_choice_gen)
