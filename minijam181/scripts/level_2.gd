extends Node2D



func _on_rabbit_1_friend_found() -> void:
	print("AMIII")
	$Rabbit1.visible = false


func _on_goal_goal() -> void:
	print("Fini level 2")


func _on_enemy_hit() -> void:
	print("Hit")
