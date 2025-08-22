extends Sprite2D 
class_name SpeedWave

@export var Speed : float
@export var Magnitude : float

var time:float =0

func _process(delta: float) -> void:
	time += delta*Speed
	position.x = (sin(time)*Magnitude)
	position.y = -(sin(time)*Magnitude)
