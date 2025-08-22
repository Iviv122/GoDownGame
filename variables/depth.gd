extends Node

class_name Depth

signal depth_update(amount:float)

var amount = 10
@export var speed = 1
@export var speedGain = 0.01

@export var stats : Array[Stat]

func _process(delta: float) -> void:
	speed += 0.01*delta

	if speed <= 5:
		for i in stats:
			i.drainSpeed = speed



	amount +=delta*speed
	emit_signal("depth_update",amount)


