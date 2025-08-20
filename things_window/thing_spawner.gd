extends Node2D 
class_name ThingSpawner

@export var cur: CurrentItem
@export var speed: float = 1000 
@export var moveDist: float = 250 
@export var cur_label : Label

func _ready() -> void:
	cur.item_changed.connect(spawn)

func spawn(item :Item) -> void:
	var a = ItemDisplay.new()
	
	a.texture = item
	a.centered = true

	a.cur = cur
	cur_label.text = item.name
	add_child(a)
