extends Node
class_name Money

var amount : int

signal changed(amount:int)

func _ready() -> void:
	amount = 0

func change(delta : int):
	amount += delta
	if amount <= 0:
		amount = 0
	changed.emit(amount)