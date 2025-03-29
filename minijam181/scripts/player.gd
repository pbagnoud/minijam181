extends CharacterBody2D

@onready var ray: RayCast2D = $RayCast2D
@onready var player: CharacterBody2D = $"."
var rabbits = []
var type = ""
var tile_size = 64
var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	rabbits.append([player, ""]) # [nom, type]
	
func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	var position_player
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		for i in range(len(rabbits)):
			if rabbits[i][0] == player: # if player
				position_player = player.position
				player.position += inputs[dir] * tile_size
			
