extends Node2D

signal friend_found

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		friend_found.emit()
		visible = false
