extends Node2D

signal friend_found

@export var type : int = 0

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		friend_found.emit()
		visible = false
