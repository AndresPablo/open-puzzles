extends Node2D
class_name TransitionManager

@onready var Animator : AnimationPlayer = $Animator

func play_scene_transition(animation_name : String) -> void:
	pass
	if(Animator == null):
		push_error("Transition animator is null")
		return
	Animator.play(animation_name)
	
func ready_to_change_scene() -> void:
	Signals.SceneTransitionReadyToChangeScene.emit()
