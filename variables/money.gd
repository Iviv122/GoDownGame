extends Node
class_name Money

var amount : int

signal changed(amount:int)

func _ready() -> void:
	amount = 0

func change(delta : int):
	amount += delta
	changed.emit(amount)