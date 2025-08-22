extends Sprite2D 
class_name ItemDisplay

@export var cur: CurrentItem
@export var speed: float = 1000 
@export var moveDist: float = 250 

@export var rotateSpeed : float = 10
@export var rotateStrength : float = 2

@export var DestroyEffect : PackedScene
@export var Effects : EffectsCaller 

var dir : Vector2
var targetPos : Vector2
var isUnused : bool = true
var isEnemy : bool 

var time : float

func _ready() -> void:
	
	change(cur.item)
	dir = position

func _process(delta: float) -> void:
	if !isUnused && position == targetPos:
		effect()
		queue_free() 

	position = position.move_toward(targetPos,speed*delta)
	time += delta*rotateSpeed
	rotation_degrees = sin(time)*rotateStrength

func effect() ->void:
	if dir == Vector2.UP:
		Effects.play_heat()
	elif  dir == Vector2.DOWN:
		Effects.play_money()
	elif  dir == Vector2.LEFT:
		Effects.play_cool()
	elif  dir == Vector2.RIGHT:
		Effects.play_oxygen()

func move(ndir : Vector2) -> void:
	dir = ndir
	targetPos =ndir*moveDist

func _input(event: InputEvent) -> void:
	if isUnused && !isEnemy:
		if event.is_action_pressed("up"):
			move(Vector2.UP)
			isUnused = false
		elif event.is_action_pressed("right"):
			move(Vector2.RIGHT)
			isUnused = false
		elif event.is_action_pressed("left"):
			move(Vector2.LEFT)
			isUnused = false
		elif event.is_action_pressed("down"):
			move(Vector2.DOWN)
			isUnused = false
		elif event.is_action_pressed("damage"):
			destroy()
	elif !isUnused:
		pass
	else:
		if event.is_action_pressed("damage"):
			destroy()

func destroy():
	var a = DestroyEffect.instantiate()
	a.position = global_position
	a.restart()
	get_tree().root.add_child(a)
	queue_free()

func change(item :Item) -> void:
	texture = item.sprite
	isEnemy = item.type == Item.ITEM_TYPE.ITEM_ENEMY
