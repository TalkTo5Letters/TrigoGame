extends CharacterBody2D

signal dialogue_pop_up

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	pass


func _on_area_2d_body_entered(body):
	dialogue_pop_up.emit() 
