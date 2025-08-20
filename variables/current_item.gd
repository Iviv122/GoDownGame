extends Node
class_name CurrentItem

@export var itemPool: ItemPool
var item: Item

@export var t: Heat 
@export var o: Oxygen
@export var f: Fuel
@export var m: Money

signal item_changed(thing: Item)

func _ready():
	reroll()

func reroll():
	item = itemPool.get_item()
	item_changed.emit(item)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("up"):
		fuel_refuel()
	elif event.is_action_pressed("right"):
		oxygen_refuel()
	elif event.is_action_pressed("left"):
		cool()
	elif event.is_action_pressed("down"):
		sell()
	elif event.is_action_pressed("damage"):
		damage()

func cool():
	if item.type == item.ITEM_TYPE.ITEM_TEMPERATURE:
		t.update(3)
		reroll()
	elif item.type == item.ITEM_TYPE.ITEM_ENEMY:
		t.update(-5)
	else:
		t.update(-5)
		reroll()

func oxygen_refuel():
	if item.type == item.ITEM_TYPE.ITEM_OXYGEN:
		o.update(3)
		reroll()
	elif item.type == item.ITEM_TYPE.ITEM_ENEMY:
		o.update(-5)
	else:
		o.update(-5)
		reroll()

func fuel_refuel():
	if item.type == item.ITEM_TYPE.ITEM_FUEL:
		f.update(3)
		reroll()
	elif item.type == item.ITEM_TYPE.ITEM_ENEMY:
		f.update(-5)
	else:
		f.update(-5)
		reroll()

func damage():
	## destroy animation
	reroll()

func sell():
	if item.type == item.ITEM_TYPE.ITEM_ENEMY:
		m.change(-1)
	else:
		m.change(1)
		reroll()
