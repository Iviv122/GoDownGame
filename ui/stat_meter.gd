extends ProgressBar 
class_name StatMeter

@export var t : Stat

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	min_value = 0 
	max_value = t.maxAmount
	value = t.amount
	t.updated.connect(update)

func update(amount : float)->void:
	value = amount

