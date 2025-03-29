extends Area2D

signal pressed
signal unpressed

@onready var button_animation: AnimatedSprite2D = $ButtonAnimation



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		button_animation.frame = 1
		pressed.emit()


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		button_animation.frame = 0
		unpressed.emit()
