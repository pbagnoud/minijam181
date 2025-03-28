extends Node2D

signal hit

var angular_speed = PI/2

@export var turning : bool = false

func flip_up() :
	scale.x = -1


func _on_enemy_detection_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") :
		pass


func _on_vision_cone_area_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") :
		hit.emit()
		
func _physics_process(delta: float) -> void:
	if turning : 
		rotation += angular_speed * delta
