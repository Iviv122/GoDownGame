extends Node2D 
class_name ThingSpawner

@export var cur: CurrentItem
@export var speed: float = 1000 
@export var moveDist: float = 250 
@export var cur_label : Label
@export var DestroyEffect : PackedScene
@export var Effects : EffectsCaller 

func _ready() -> void:
	cur.item_changed.connect(spawn)

func spawn(item :Item) -> void:
	var a = ItemDisplay.new()
	
	a.texture = item
	a.centered = true

	a.cur = cur
	a.DestroyEffect = DestroyEffect
	cur_label.text = item.name
	a.Effects = Effects

	add_child(a)