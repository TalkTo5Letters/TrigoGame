extends Area2D

# Exposed variable for the collision shape
@export var collision_shape_path : CollisionShape2D
@export var player : CharacterBody2D

# This function is called when something exits the Area2D

func _on_area_exited(body):
	if body.is_in_group(player):
		# Get the collision shape node
		var collision_shape_node = $"collision_shape_path"

		# Check if the collision shape node exists and is a CollisionShape2D
		if collision_shape_node != null and collision_shape_node is CollisionShape2D:
			# Get the size of the collision shape
			var collision_shape_size = collision_shape_node.shape.extents

			# Assuming your player is a KinematicBody2D or similar
			if body.global_position.x < global_position.x:
				# Player exited on the left, teleport to the right
				body.global_position.x = global_position.x + collision_shape_size.x
			else:
				# Player exited on the right, teleport to the left
				body.global_position.x = global_position.x - collision_shape_size.x
	pass # Replace with function body.

