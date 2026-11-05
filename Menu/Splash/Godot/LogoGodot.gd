extends Node

@onready var Animator : AnimationPlayer = $Animator

func _ready() -> void:
	Animator.animation_finished.connect(_on_animation_finished)
	Animator.play("Transition")

func _on_animation_finished(_name: String) -> void:
	print("finished")
	SceneManager.change_scene("MainMenu")
