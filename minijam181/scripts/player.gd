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


###############################################################################################################################################
###############################################################################################################################################


func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	await get_tree().create_timer(0.1).timeout
	add_follower(0)
	
	
func _process(delta):
	if Input.is_action_just_pressed("Switch"):
		self.switch()	

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func move(dir):
	var last_pos
	var current_pos
	ray.target_position = inputs[dir] * tile_size
	print("ray", ray.target_position)
	print("premier", rabbits[0][0].position, ray.position, player.position)
	ray.force_raycast_update()
	if !ray.is_colliding():
		last_pos = rabbits[0][2] # Keep the last position of the first in rabbits
		rabbits[0][0].position += inputs[dir] * tile_size # Move the first in rabbits
		rabbits[0][2] = rabbits[0][0].position # Update position in rabbits
		position = rabbits[0][2] # Move player with first rabbit
		for i in range(1, len(rabbits)):
			current_pos = last_pos
			last_pos = rabbits[i][0].position
			rabbits[i][0].position = current_pos
			rabbits[i][2] = rabbits[i][0].position # Update position in rabbits


###############################################################################################################################################
###############################################################################################################################################


func add_follower(type):
	print(type)
	var newfollower = follower.instantiate()
	get_parent().add_child(newfollower)
	newfollower.position = self.position + Vector2(0,1)*tile_size
	newfollower.change_type(type)
	rabbits.append([newfollower, type, newfollower.position])
	print(rabbits)

func switch():
	print("Switch")
	print(rabbits)
	rabbits.reverse()
	print(rabbits)
	position = rabbits[0][2]

	
	
