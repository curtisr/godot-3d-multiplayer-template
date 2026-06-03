extends Area3D

func _on_body_entered(body: Node3D) -> void:
	var player = Network.getPlayer()
	if body is Character and body != player:
		body.hurt.rpc( 3 )
	pass # Replace with function body.
