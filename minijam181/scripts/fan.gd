extends RigidBody2D

var direction

func push_player(player, direction):
	if player.has_method("pushed"):
		player.pushed(direction)
