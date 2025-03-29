extends CharacterBody2D

@onready var ray: RayCast2D = $RayCast2D
@onready var player: CharacterBody2D = $"."
var follower = preload("res://scenes/follower.tscn")

var rabbits = []
var type = ""

var tile_size = 64
var inputs = {"ui_right": Vector2.RIGHT,
			"ui_left": Vector2.LEFT,
			"ui_up": Vector2.UP,
			"ui_down": Vector2.DOWN}

################################################################################
################################################################################

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	rabbits.append([player, "", position]) # [nom, type, position]
	
func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	var last_pos
	var current_pos
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		last_pos = player.position
		player.position += inputs[dir] * tile_size
		for i in range(1, len(rabbits)):
			current_pos = last_pos
			last_pos = rabbits[i][0].position
			print("last", last_pos)
			print("currrent" ,current_pos)
			rabbits[i][0].position = current_pos

func add_follower(type):
	var newfollower = follower.instantiate()
	get_parent().add_child(newfollower)
	newfollower.position = self.position + Vector2(0,1)*tile_size
	rabbits.append([newfollower, type, newfollower.position])
	print(rabbits)

func pushed(direction):
	player.position += direction * tile_size * 4
	rabbits[0][2] = player.position

func switch():
	var last_rabbit = rabbits[-1]
	var first_rabbit = rabbits[0]
	rabbits[0][1] = last_rabbit[1]
	rabbits[0][2] = last_rabbit[2]
	rabbits[-1][1] = first_rabbit[1]
	rabbits[-1][2] = last_rabbit[2]
	
	
