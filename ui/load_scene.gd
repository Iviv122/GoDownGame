extends Button 
class_name SceneLoader

@export var sceneToLoad : String

func _pressed() -> void:
	get_tree().change_scene_to_file(sceneToLoad)