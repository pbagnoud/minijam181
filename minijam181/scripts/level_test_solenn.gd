extends Node2D

@onready var enemy_1: AnimatableBody2D = $Enemy1
@onready var enemy_2: AnimatableBody2D = $Enemy2
@onready var enemy_3: AnimatableBody2D = $Enemy3
@onready var porte_1: StaticBody2D = $porte1
@onready var porte_2: StaticBody2D = $porte2

var onoff : int = 1

func _ready() -> void:
	#enemy.turning = true
	pass
	
func _on_level_timer_timeout() -> void:
	#enemy.scale.x = -1
	#if onoff == 1 :
		#enemy_1.rotation_degrees += 180
		#enemy_2.rotation_degrees += 180
		#enemy_3.rotation_degrees += 180
		#onoff = 0
	#else :
		#enemy_1.rotation_degrees -= 180
		#enemy_2.rotation_degrees -= 180
		#enemy_3.rotation_degrees -= 180
		#onoff = 1
	if onoff == 1:
		enemy_1.scale.x = -1
		enemy_2.scale.x = -1
		enemy_3.scale.x = -1
	pass

func _on_enemy_hit() -> void:
	print("Aie")


func _on_button_pressed() -> void:
	porte_1.visible = true
	porte_1.set_collision_layer_value(2, true)
	porte_2.visible = true
	porte_2.set_collision_layer_value(2, true)

func _on_button_unpressed() -> void:
	porte_1.visible = false
	porte_1.set_collision_layer_value(2, false)
	porte_2.visible = false
	porte_2.set_collision_layer_value(2, false)
