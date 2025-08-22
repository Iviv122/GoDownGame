extends Node

class_name ItemPool

## change to queue like in modern tetris?

@export var items : Array[Item]

func get_item() -> Item:
	return items.pick_random()