extends Node2D
@onready var player: CharacterBody2D = $Player
@onready var hint_timer: Timer = $HintTimer


func _on_rabbit_1_friend_found(type) -> void:
	player.add_follower(type)
	hint_timer.start()


func _on_goal_goal() -> void:
	print("Fini level 2")


func _on_enemy_hit() -> void:
	print("Hit")
