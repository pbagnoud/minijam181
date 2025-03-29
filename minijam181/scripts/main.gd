extends Node2D

@onready var end_screen: ColorRect = $EndScreen

func _on_goal_goal() -> void:
	print("FINI")
	end_screen.visible = true
	# Terminer la scene et passer au niveau suivant


func _on_enemy_hit() -> void:
	print("HIT")
	# Terminer la scène et indiquer la défaite, proposer de recommencer ?

func _on_next_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
