extends Label 
class_name RandomLabel

@export var list : Array[String]

func _ready() -> void:
	text = list.pick_random()
