extends Node2D
class_name Shaker 

@export var curv : CurveTexture
@export var speed : float
@export var amplify : float


var time :float
var pos : Vector2

func _ready() -> void:
	time = -1
	pos = position

func _process(delta: float) -> void:
	time += delta*speed
	if time >= 1:
		time = -1
	position.x = pos.x+curv.curve.sample(time)*amplify
	position.y = pos.y+curv.curve.sample(time)*amplify
