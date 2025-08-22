extends Node

class_name ItemPool

## change to queue like in modern tetris?

@export var items : Array[Item]
var queue : Array[Item] = []

func  _ready():
	reroll()	

func reroll():
	items.shuffle()
	for i in items:
		queue.push_back(i)

func get_item() -> Item:
	var item = queue.back()
	queue.pop_back()
	if item == null:
		reroll()
		return items.pick_random()
	return item 