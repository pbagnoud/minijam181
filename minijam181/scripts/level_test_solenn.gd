extends Node2D

@onready var enemy: AnimatableBody2D = $Enemy



func _on_level_timer_timeout() -> void:
	enemy.scale.x = -1


func _on_enemy_hit() -> void:
	print("Aie")
