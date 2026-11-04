extends Node

const DefaultTransition: String = "Vertical"

const  SCENES = {
	"LogoSplash": 	"uid://dng2p4fwnjg3l",
	"LogoGodot": 	"uid://dy27eohoareeh",
	"MainMenu": 	"uid://cw4taodfs5pqx",
}


var current_scene : Node = null
var pending_scene_path : String = ""

func _ready() -> void:
	Signals.SceneTransitionReadyToChangeScene.connect(_on_ready_to_change_scene)

func load_initial_scene(_scene_name: String) -> void:
	if !SCENES.has(_scene_name):
		push_error("Scene '%s' not in SceneManager SCENES" + _scene_name)
		return
	pending_scene_path = ""
	_swap_to_scene(SCENES[_scene_name])


func change_scene(_scene_name : String, _transition : String = DefaultTransition) -> void:
	if(!SCENES.has(_scene_name)):
		push_error("Escena no encontrada en el diccionario SCENES de SceneManager." % _scene_name)
		return
	pending_scene_path = SCENES[_scene_name]
	
func _on_ready_to_change_scene() -> void:
	if(pending_scene_path == ""):
		push_warning("No pen")
	
func _swap_to_scene(_scene_name: String) -> void:
	var _packed_scene : PackedScene = load(_scene_path)
	if _packed_scene == null:
		push_error("Failed to load scene at path: ", pending_scene_path)
		
	
