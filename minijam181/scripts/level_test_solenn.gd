extends Node2D

@onready var enemy: AnimatableBody2D = $Enemy

func _ready() -> void:
	enemy.turning = true

func _on_level_timer_timeout() -> void:
	#enemy.scale.x = -1
	#enemy.rotation_degrees += 90
	pass

func _on_enemy_hit() -> void:
	print("Aie")
