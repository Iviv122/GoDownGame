extends Node
class_name SmashToLoad

@export var SceneLoad : String

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("damage"):
		loadScene()

func loadScene():
	get_tree().change_scene_to_file(SceneLoad)