extends Node2D

signal friend_found
@onready var rabbit_sprite: AnimatedSprite2D = $RabbitSprite

@export var type : int 

func _ready() -> void:
	rabbit_sprite.frame = type

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		friend_found.emit(rabbit_sprite.frame)
		queue_free()
