extends Label 
class_name MoneyMeter
@export var m : Money

func _ready() -> void:

	m.changed.connect(update)
	text = str(m.amount)

func update(a : int)-> void:
	text = str(a)
