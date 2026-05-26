class_name Item
extends Resource

@export var id: String = ""
@export var name: String = ""
@export var description: String = ""
@export var icon: Texture2D

@export var stackable: bool = true
@export var max_stack: int = 99

@export var item_type: ItemType = ItemType.MISC
@export var rarity: ItemRarity = ItemRarity.COMMON
@export var value: int = 0
# an array of integers from an enum
@export var context_options: Array[int] = [ContextOptions.DROP]
# not sure we need the whole scene, just a path should be enough
@export var scene_path: String = "res://scenes/objects/apple.tscn" 

enum ItemType {
	WEAPON,
	ARMOR,
	CONSUMABLE,
	TOOL,
	MISC
}

enum ItemRarity {
	COMMON,
	UNCOMMON, 
	RARE,
	EPIC,
	LEGENDARY
}

enum ContextOptions { 
	DRINK,
	EAT, 
	DROP,
	EQUIP,
	THROW,
	READ
}

func to_dict() -> Dictionary:
	return {
		"id": id,
		"name": name,
		"description": description,
		"stackable": stackable,
		"max_stack": max_stack,
		"item_type": item_type,
		"rarity": rarity,
		"value": value,
		"context_options": context_options,
		"scene_path": scene_path
	}

func from_dict(data: Dictionary) -> void:
	id = data.get("id", "")
	name = data.get("name", "")
	description = data.get("description", "")
	stackable = data.get("stackable", true)
	max_stack = data.get("max_stack", 99)
	item_type = data.get("item_type", ItemType.MISC)
	rarity = data.get("rarity", ItemRarity.COMMON)
	value = data.get("value", 0)
	context_options = data.get("context_options", [ContextOptions.DROP])
	scene_path = data.get("scene_path", "res://scenes/items/apple.tscn")
	
 
func can_stack_with(other_item: Item) -> bool:
	return stackable && other_item.stackable && id == other_item.id

func drink(): 
	print( "default drinking happened, mmm good")

func eat():
	print( "default eat happened, mmm tasty")	
	
func drop( drop_node : Node3D ):
	
	print( "default drop" )
	
	var player = drop_node.get_node("..")._get_local_player()
	var marker_position = player.get_child("Marker3D").position
	# drop at player position into "environment
	print("green eggs and hame")
	print( marker_position )
	var player_position = player.position + marker_position
	
	player.add_world_item.rpc( scene_path, player_position )



func equip():
	print( "default equip" )

func throw():
	print( "default throw?! not sure how we will do this")

func read():
	print("defaul read called")
