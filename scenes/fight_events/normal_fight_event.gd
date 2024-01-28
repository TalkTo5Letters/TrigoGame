extends Control
var quest_data
var quest_gen
var multi_choice_gen_scene
var area_drop_gen_scene
var multi_choice_gen
var area_drop_gen
var fill_in_gen
var fill_in_gen_scene
# Called when the node enters the scene tree for the first time.
func _ready():
	quest_gen = $QuestionGenerator
	multi_choice_gen_scene = preload("res://scenes/fight_events/multiple_choice/multi_choice_grid.tscn")
	area_drop_gen_scene = preload("res://scenes/fight_events/multiple_choice/create_droppable_area.tscn")
	fill_in_gen_scene = preload("res://scenes/fight_events/fill_in_blanks/fill_in_parser.tscn")
	generate_question(Global.enemy_type)


# Called every frame. 'delta' is the elapsed time since the predvious frame.
func _process(delta):
	pass

func generate_question(enemy_type):
	var quest_data = quest_gen.get_question(enemy_type)
	$check_ans.quest_data = quest_data
	print(quest_data)
	var quest_type = quest_data.get("type")
	var choices = quest_data.get("choices")
	$Label.text = quest_data.get("question")
	print(choices)
	match quest_type:
		1:
			multi_choice_gen = multi_choice_gen_scene.instantiate()
			area_drop_gen = area_drop_gen_scene.instantiate()
			multi_choice_gen.data = quest_data
			add_child(area_drop_gen)
			add_child(multi_choice_gen)
		2:
			fill_in_gen = fill_in_gen_scene.instantiate()
			fill_in_gen.data = quest_data
			add_child(fill_in_gen)
			
			
func reload():
	remove_child(area_drop_gen)
	remove_child(multi_choice_gen)
	remove_child(fill_in_gen)
	print("reset")
	generate_question(Global.enemy_type)
	
