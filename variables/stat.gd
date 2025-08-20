extends Node
class_name Stat

@export var amount : float= 0
@export var maxAmount : float = 20
@export var drainSpeed : float = 1

signal updated(amount:float)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	amount = maxAmount

func update(delta : float) -> void:
	amount += delta
	if amount > maxAmount:
		amount = maxAmount
	if amount <= 0:
		amount = 0
		# lose signal
	updated.emit(amount)

func _process(delta: float) -> void:
	update(-delta*drainSpeed)