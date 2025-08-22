extends Node
class_name EffectsCaller

@export var oxygen : PackedScene
@export var oxPos : Vector2

@export var heat : PackedScene 
@export var heatPos : Vector2

@export var money : PackedScene 
@export var moneyPos : Vector2

@export var cool : PackedScene 
@export var coolPos : Vector2


func play_money() ->void:
	spawn(money,moneyPos)
func play_heat() ->void:
	spawn(heat,heatPos)
func play_cool() ->void:
	spawn(cool,coolPos)
func play_oxygen() ->void:
	spawn(oxygen,oxPos)

func spawn(ef : PackedScene,pos : Vector2) -> void:
	var a = ef.instantiate()
	a.position = pos
	add_child(a)
	a.restart()
