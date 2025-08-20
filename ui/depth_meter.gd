extends Label 

class_name DepthMeter

@export var d : Depth 

func _ready() -> void:
	d.connect("depth_update",update)

func update(amount : float):
	text = "%.2f" % amount + " meters"
	
