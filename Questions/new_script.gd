extends Node

var rng = RandomNumberGenerator.new()
var Easy_UnitCir_QA = {
	"What is the length of the unit circle?" : [["pi", "pi/2", "2pi", "3pi/4"], "2pi"],
	"Trigonometry is the study of what?" : [["History", "Sides and Angles of Triangles", "Shapes", "Love"], "Sides and Angles of Triangles"],
	"The rotation of negative angles?" : [["Clockwise", "Counter-Clockwise", "Wiseclock", "Counter-Wiseclock"], "Clockwise"] ,
	"Measurement of right triangle?" : [["69 degrees", "90 degrees", "120 degrees", "180 degrees"], "180 degrees"],
	"Measurement of scalene triangle?" : [["69 degrees", "90 degrees", "120 degrees", "180 degrees"], "180 degrees"],
	"Measurement of Obtuse triangle?" : [["69 degrees", "90 degrees", "120 degrees", "180 degrees"], "180 degrees"],
	"Measurement of Isosceles triangle?" : [["69 degrees", "90 degrees", "120 degrees", "180 degrees"], "180 degrees"],
	"Measurement of Equilateral triangle?" : [["69 degrees", "90 degrees", "120 degrees", "180 degrees"], "180 degrees"],
	"What is the diameter of a unit circle?" : [["1", "2", "3", "314"], "2"],
	"What is the radius of a unit circle?" : [["1", "2", "3", "314"], "1"],
}
var Easy_UnitCir_QA_coor = {
	"What is the Coordinates of 30 degrees in a Unit Circle?" : [sqrt(3)/2, 1/2],
	"What is the Coordinates of 45 degrees in a Unit Circle?" : [sqrt(2)/2, sqrt(2)/2],
	"What is the Coordinates of 60 degrees in a Unit Circle?" : [1/2, sqrt(3)/2],
	"What is the Coordinates of 90 degrees in a Unit Circle?" : [0, 1],
	"What is the Coordinates of 120 degrees in a Unit Circle?": [-1/2, sqrt(3)/2],
	"What is the Coordinates of 135 degrees in a Unit Circle?": [-sqrt(2)/2, sqrt(2)/2],
	"What is the Coordinates of 150 degrees in a Unit Circle?": [-sqrt(3)/2, 1/2],
	"What is the Coordinates of 180 degrees in a Unit Circle?": [-1, 0],
	"What is the Coordinates of 210 degrees in a Unit Circle?": [-sqrt(3)/2, -1/2],
	"What is the Coordinates of 225 degrees in a Unit Circle?": [-sqrt(2)/2, -sqrt(2)/2],
	"What is the Coordinates of 240 degrees in a Unit Circle?": [-1/2, -sqrt(3)/2],
	"What is the Coordinates of 270 degrees in a Unit Circle?": [0, -1],
	"What is the Coordinates of 300 degrees in a Unit Circle?": [1/2, -sqrt(3)/2],
	"What is the Coordinates of 315 degrees in a Unit Circle?": [sqrt(2)/2, -sqrt(2)/2],
	"What is the Coordinates of 330 degrees in a Unit Circle?": [sqrt(3)/2, - 1/2],
	"What is the Coordinates of 360 degrees in a Unit Circle?": [1, 0],
}

var Easy_UnitCir_QA_degrees = [
	[["sqrt(3)/2", "1/2"], 30],
	[["sqrt(2)/2", "sqrt(2)/2"], 45],
	[["1/2", "sqrt(3)/2"], 60],
	[["0", "1"], 90],
	[["-1/2", "sqrt(3)/2"], 120],
	[["-sqrt(2)/2", "sqrt(2)/2"], 135],
	[["-sqrt(3)/2", "1/2"], 150],
	[["-1", "0"], 180],
	[["-sqrt(3)/2", "-1/2"], 210],
	[["-sqrt(2)/2", "-sqrt(2)/2"], 225],
	[["-1/2", "-sqrt(3)/2"], 240],
	[["0", "-1"], 270],
	[["1/2", "-sqrt(3)/2"], 300],
	[["sqrt(2)/2", "-sqrt(2)/2"], 315],
	[["sqrt(3)/2", "- 1/2"], 330],
	[["1", "0"],  360],
]

var Easy_UnitCir_QA_dupl = Easy_UnitCir_QA.duplicate()
var Easy_UnitCir_QA_coor_dupl = Easy_UnitCir_QA_coor.duplicate()
var Easy_UnitCir_QA_degrees_dupl = Easy_UnitCir_QA_degrees.duplicate()

func quadrantno():
	var random_degree = rng.randi_range(1, 359)
	var answer: String
	while random_degree == 90 || random_degree == 180 || random_degree == 270:
		random_degree = rng.randf_range(1, 359)
	if random_degree >= 1 && random_degree <= 89:
		answer = "Quadrant 1"
	elif random_degree >= 91 && random_degree <= 179:
		answer = "Quadrant 2"
	elif random_degree >= 181 && random_degree <= 269:
		answer = "Quadrant 3"
	elif random_degree >= 271 && random_degree <= 359:
		answer = "Quadrant 4"
	var question: String = "What Quadrant is: " + str(random_degree) + " degrees in?"
	var QA = [question, answer]
	return QA

func pos_or_neg() :
	var random_axis = rng.randi_range(1, 2)
	var random_degree = rng.randi_range(1, 359)
	var array_answer
	var axis_answer
	var answer
	var question: String
	while random_degree == 90 || random_degree == 180 || random_degree == 270:
		random_degree = rng.randf_range(1, 359)
	while true:
		if random_degree >= 1 && random_degree <= 89:
			array_answer = [1,1]
			break
		elif random_degree >= 91 && random_degree <= 179:
			array_answer = [0,1]
			break
		elif random_degree >= 181 && random_degree <= 269:
			array_answer = [0,0]
			break
		elif random_degree >= 271 && random_degree <= 359:
			array_answer = [1,0]
			break
		else:
			pass
	if random_axis == 1:
		question = "Does the x axis in " + str(random_degree) + " degrees have a Negative or Positive Value?"
		axis_answer = array_answer[0]
	elif random_axis == 2:
		question = "Does the y axis in " + str(random_degree) + " degrees have a Negative or Positive Value?"
		axis_answer = array_answer[1]
	answer = [question, axis_answer]
	return answer 
	
func Easy_UnitCir_QA_vals():
	if Easy_UnitCir_QA_dupl.is_empty():
		print("Easy_UnitCir_QA_dupl is empty")
	else:
		var rng:int = rng.randi_range(1, Easy_UnitCir_QA_dupl.size()) - 1
		var question = Easy_UnitCir_QA_dupl.keys()[rng]
		var choices = Easy_UnitCir_QA_dupl.values()[rng][0]
		var answer = Easy_UnitCir_QA_dupl.values()[rng][1]
		Easy_UnitCir_QA_dupl.erase(Easy_UnitCir_QA_dupl.keys()[rng])
		print(question, choices, answer)

func Easy_UnitCir_QA_coor_vals():
	if Easy_UnitCir_QA_coor_dupl.is_empty():
		print("Easy_UnitCir_QA_coor_dupl is empty")
	else:
		var rng:int = rng.randi_range(1, Easy_UnitCir_QA_coor_dupl.size()) - 1
		var question = Easy_UnitCir_QA_coor_dupl.keys()[rng]
		var answer = Easy_UnitCir_QA_coor_dupl.values()[rng]
		var choices = ["+", "-", "sqrt(2)/sqrt(2)", "sqrt(3)/2", "1/2", "0", "1"]
		Easy_UnitCir_QA_coor_dupl.erase(Easy_UnitCir_QA_coor_dupl.keys()[rng])
		print(question, choices, answer)
	
func Easy_UnitCir_QA_degrees_vals():
	if Easy_UnitCir_QA_degrees_dupl.is_empty():
		print("Easy_UnitCir_QA_degrees_dupl is empty")
	else:
		var rng:int = rng.randi_range(1, Easy_UnitCir_QA_degrees_dupl.size()) - 1
		var question = "What degree is the following element? " + str(Easy_UnitCir_QA_degrees_dupl[rng][0])
		var answer = Easy_UnitCir_QA_degrees_dupl[rng][1]
		Easy_UnitCir_QA_degrees_dupl.remove_at(rng)
		print(question, answer)
