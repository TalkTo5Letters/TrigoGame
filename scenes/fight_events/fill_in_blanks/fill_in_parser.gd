extends Control
var data
var type
var choice_gen
var droppable_area_gen
var identifier = []
var identifier_ans =  {}
# Called when the node enters the scene tree for the first time.
func _ready():
	var emitter = get_node("/root/EventHandler")
	choice_gen = preload("res://scenes/fight_events/fill_in_blanks/choice_gen.tscn").instantiate()
	droppable_area_gen = preload("res://scenes/fight_events/fill_in_blanks/droppable_area_gen.tscn").instantiate()
	type = data.get("fill_type")
	emitter.ans_delivery.connect(check_answer.bind())
	match type:
		"normal":
			normal_parse(data)
		"trigo":
			pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func normal_parse(data): #"+", "-", "sqrt(2)/sqrt(2)", "sqrt(3)/2", "1/2", "0", "1"
	var parsed_answer = []
	var answers = data.get("answer")
	for i in answers.size():
		identifier.append(i)
		var minus_index = answers[i].find("-")
		print("GYAHAHAHAHAHAHA", minus_index)
		print(answers[i])
		if minus_index == -1:
			var value = "+"
			parsed_answer.append(value)
			parsed_answer.append(answers[i])
		else:
			var value = "-"
			var string = answers[i].erase(minus_index)
			parsed_answer.append(value)
			parsed_answer.append(string)
			
	data["answer"] = parsed_answer
	var correct_ans = "".join(parsed_answer)
	for i in parsed_answer.size():
		identifier_ans[i] = "empty"
	choice_gen.data = data
	droppable_area_gen.data = data
	add_child(choice_gen)
	add_child(droppable_area_gen)
	
func check_answer(identifier_name, ans):
	var iden_size = data.get("answer").size()
	var complete_no = 0
	var complete = false
	identifier_ans[identifier_name] = ans
	for i in identifier_ans:
		if str(identifier_ans[i]) != "empty":
			complete_no += 1
		else:
				pass
	if complete_no >= iden_size:
		var str_array = []
		for n in identifier_ans:
			str_array.append(str(identifier_ans[n]))
		var combined_ans = "".join(str_array)
		var correct_ans = "".join(data["answer"])
		print(correct_ans)
		print(combined_ans)
		if combined_ans == correct_ans:
			identifier_ans = {}
			EventHandler.emit_signal("answer_state", true)
		else:
			identifier_ans = {}
			EventHandler.emit_signal("answer_state", false)
