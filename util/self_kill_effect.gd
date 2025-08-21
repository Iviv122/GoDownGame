extends GPUParticles2D 
class_name SelfKillEffect

@export var activateChilds : Array[GPUParticles2D]

func _ready() -> void:

	for i in activateChilds:
		i.restart()

	await  get_tree().create_timer(lifetime).timeout 
	queue_free()

