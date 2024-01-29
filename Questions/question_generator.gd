extends Node2D
var easy_unitcir_QA
var type: int
var rgen = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	easy_unitcir_QA = $Easy_unit_cir_QA

func _process(delta):
	pass

func get_question(type):
	print(type)
	match type:
		1: #unit circle qustion
			var rng = rgen.randi_range(1, 5)
			print(rng)
			match rng:
				1: 
					var quest_data = easy_unitcir_QA.Easy_UnitCir_QA_vals()
					print(quest_data)
					return quest_data
				2:
					var quest_data = easy_unitcir_QA.Easy_UnitCir_QA_coor_vals()
					return quest_data
				3:
					var quest_data = easy_unitcir_QA.quadrantno()
					return quest_data
				4:
					var quest_data = easy_unitcir_QA.pos_or_neg()
					return quest_data
				5: 
					var quest_data = easy_unitcir_QA.Easy_UnitCir_QA_degrees_vals()
					return quest_data
