extends StaticBody2D

@export var direction : String

func _ready() -> void:
	if direction == "Left" :
		self.rotation_degrees += 90
	if direction == "Up" :  
		self.rotation_degrees += 180
	if direction == "Right" :
		self.rotation_degrees -= 90
		
		
func push_player(player, direction):
	if player.has_method("pushed"):
		player.pushed(direction)


func _on_push_area_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
