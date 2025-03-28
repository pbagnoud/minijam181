extends Node2D

@onready var enemy_1: AnimatableBody2D = $Enemy1
@onready var enemy_2: AnimatableBody2D = $Enemy2
@onready var enemy_3: AnimatableBody2D = $Enemy3

var onoff : int = 1

func _ready() -> void:
	#enemy.turning = true
	pass
	
func _on_level_timer_timeout() -> void:
	#enemy.scale.x = -1
	if onoff == 1 :
		enemy_1.rotation_degrees += 180
		enemy_2.rotation_degrees += 180
		enemy_3.rotation_degrees += 180
		onoff = 0
	else :
		enemy_1.rotation_degrees -= 180
		enemy_2.rotation_degrees -= 180
		enemy_3.rotation_degrees -= 180
		onoff = 1
	

func _on_enemy_hit() -> void:
	print("Aie")
