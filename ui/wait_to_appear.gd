extends Control 
class_name WaitToAppear

@export var delay : float

var started : float = 0 

func _ready() -> void:
	modulate.a = 0
	await get_tree().create_timer(delay).timeout
	start()

func start() ->void:
	started = 1 

func _process(delta: float) -> void:
	modulate.a += delta*started
