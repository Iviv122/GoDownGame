extends CanvasLayer 
class_name LoseCanvas 

@export var stats : Array[Stat]
@export var M : Money 
@export var D : Depth

@export var AppearSpeed : float
@export var HideCanvas : Node 

@export var FinalDepth : float 
@export var FinalMoney : float 

@export var MoneyLabel : Label
@export var DepthLabel : Label

var isLosing = false

func _ready() -> void:
	for i in stats:
		i.lose.connect(appear)
	offset.y = 2500
	isLosing = false

func appear() -> void:
	print("Lost")

	FinalMoney = M.amount
	FinalDepth = D.amount 

	MoneyLabel.text = "Money got: " + str(FinalMoney)
	DepthLabel.text = "Depth got: " + "%.2f" % FinalDepth + " meters"


	HideCanvas.hide()
	for i in stats:
		i.lose.disconnect(appear)
	isLosing = true

func _process(delta: float) -> void:
	if isLosing:
		if offset.y > 0:
			offset.y-=AppearSpeed*delta
		else:
			offset.y = 0
