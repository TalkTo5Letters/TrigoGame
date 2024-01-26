extends CharacterBody2D

signal dialogue_pop_up

func _on_area_2d_body_entered(body):
	dialogue_pop_up.emit() 
