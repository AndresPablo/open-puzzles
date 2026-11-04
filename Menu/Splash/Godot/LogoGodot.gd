extends Node

@onready var Animator : AnimationPlayer = $Animator

func _ready() -> void:
	Animator.animation_finished.connect(_on_animation_finished)
	Animator.play("Animation")

func _on_animation_finished(anim: String) -> void:
	SceneManager.change_scene("MainMenu")
