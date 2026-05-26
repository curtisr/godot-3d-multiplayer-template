extends RigidBody3D
class_name BaseRigidBody3D

@export var replicated_transform : Transform3D
@export var replicated_linear_velocity : Vector3
@export var replicated_angular_velocity : Vector3
var prev_replicated_transform : Transform3D
var prev_replicated_linear_velocity : Vector3
var prev_replicated_angular_velocity : Vector3

func _integrate_forces(state : PhysicsDirectBodyState3D) -> void:
	if multiplayer.is_server():
		replicated_transform = state.transform
		replicated_linear_velocity = state.linear_velocity
		replicated_angular_velocity = state.angular_velocity
	else:
		if replicated_transform != prev_replicated_transform:
			state.transform = replicated_transform
			prev_replicated_transform = replicated_transform
		if replicated_linear_velocity != prev_replicated_linear_velocity:
			state.linear_velocity = replicated_linear_velocity
			prev_replicated_linear_velocity = replicated_linear_velocity
		if replicated_angular_velocity != prev_replicated_angular_velocity:
			state.angular_velocity = replicated_angular_velocity
			prev_replicated_angular_velocity = replicated_angular_velocity
