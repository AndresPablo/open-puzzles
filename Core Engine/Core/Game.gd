extends Node

#region Settings

var is_game_pausable : bool = true
var game_paused : bool = false

#endregion


#region  Scene Variables

var current_scene = null
var App
var Music
var SFX
var Scene
var Transition
var UI

#endregion

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	App = get_tree().root.get_node("App")
	
	Scene = App.get_child(0)
	UI = App.get_child(1)
	Transition = App.get_child(3)
	
	SceneManager.load_initial_scene("LogoSplash")
	

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("Menu") and  is_game_pausable):
		game_paused != game_paused
	
func _notification(what: int) -> void:
	pass

func set_paused(status:bool):
	get_tree().paused = status
	current_scene.set_process(!status)
	
func quit_game():
	get_tree().quit()
