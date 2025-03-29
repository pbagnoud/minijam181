extends StaticBody2D
@onready var follower_sprite: AnimatedSprite2D = $FollowerSprite

@export var type : int

func change_type(newtype) :
	follower_sprite.frame = newtype
	type=newtype
