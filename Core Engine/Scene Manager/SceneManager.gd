extends Node

const DefaultTransition: String = "Vertical"

const  SCENES = {
	"LogoSplash": 	"uid://dng2p4fwnjg3l",
	"GodotSplash": 	"uid://dy27eohoareeh",
	"MainMenu": 	"uid://cw4taodfs5pqx",
}


var current_scene : Node = null
var pending_scene_path : String = ""

func _ready() -> void:
	Signals.SceneTransitionReadyToChangeScenes.connect(_on_ready_to_change_scene)

func load_initial_scene(scene_name: String) -> void:
	if !SCENES.has(scene_name):
		push_error("Scene '%s' not in SceneManager SCENES" + scene_name)
		return
	pending_scene_path = ""
	_swap_to_scene(SCENES[scene_name])


func change_scene(scene_name : String, _transition : String = DefaultTransition) -> void:
	print("cambiando escena...", scene_name)
	if(!SCENES.has(scene_name)):
		push_error("Escena no encontrada en el diccionario SCENES de SceneManager." % scene_name)
		return
		
	pending_scene_path = SCENES[scene_name]
	Game.Transition.play_scene_transition(_transition)
	
func _on_ready_to_change_scene() -> void:
	if(pending_scene_path == ""):
		push_warning("No pending scene path")
		return
	_swap_to_scene(pending_scene_path)
	pending_scene_path = ""
	
func _swap_to_scene(scene_path: String) -> void:
	var _packed_scene : PackedScene = load(scene_path)
	if _packed_scene == null:
		push_error("Failed to load scene at path: ", pending_scene_path)
		return
		
	var _new_scene := _packed_scene.instantiate()
	if(current_scene):
		current_scene.queue_free()
		
	current_scene = _new_scene
	Game.Scene.add_child(_new_scene)
