extends Node2D
@onready var player: CharacterBody2D = $Player
@onready var hint_timer: Timer = $HintTimer
@onready var death_screen: ColorRect = $DeathScreen



func _on_rabbit_1_friend_found(type) -> void:
	player.add_follower(type)
	hint_timer.start()


func _on_goal_goal() -> void:
	print("Fini level 2")


func _on_enemy_hit() -> void:
	print("Hit")


func _on_poison_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if player.type != 1 :
			print(player.type)
			died_of_poison()
		pass
			
func died_of_poison() :
	death_screen.visible = true


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
