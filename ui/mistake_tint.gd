extends Sprite2D 
class_name MistakeTint

var val : float =0 
@export var speed : float = 1 
@export var curitem : CurrentItem

func _ready() -> void:
	curitem.mistake.connect(damage)
	val = 0
	material.set_shader_parameter('Alpha',val)

func damage() -> void:
	val = 1
	material.set_shader_parameter('Alpha',val)

func _process(delta: float) -> void:
	val -= delta*speed
	material.set_shader_parameter('Alpha',val)
