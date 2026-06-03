extends BaseRigidBody3D
class_name RubyRedPotion3D

var item_id = "health_potion"
static var current_player: Character

# result means the item is consumed
static func drink() -> bool:
	if not current_player or not current_player.get_inventory():
		print("doesnt find player not current player")
		return false
			
	print("adding health to player glug glug glug")
	return true
