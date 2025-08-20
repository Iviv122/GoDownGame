extends Node

class_name Depth

signal depth_update(amount:float)

var amount = 10
var speed = 1

func _process(delta: float) -> void:
	amount +=delta*speed
	emit_signal("depth_update",amount)