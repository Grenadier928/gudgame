extends CharacterBody2D
const WALK_FORCE = 600


var bullet = preload("res://scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	pass

func _physics_process(delta):
	# Horizontal movement code. First, get the player's input.
	#var walk = WALK_FORCE * (Input.get_axis(&"move_left", &"move_right"))
	var left = Input.get_axis(&"ui_left", &"ui_right")
	var up = Input.get_axis(&"ui_up", &"ui_down")
	var my_vec = Vector2(left, up)
	my_vec = my_vec * Vector2(2,2)
	move_and_collide(my_vec)
	# Slow down the player if they're not trying to move.
	#velocity.x = walk
	#velocity.

	# Vertical movement code. Apply gravity.
	#velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	# TODO: This information should be set to the CharacterBody properties instead of arguments: snap, Vector2.DOWN, Vector2.UP
	# TODO: Rename velocity to linear_velocity in the rest of the script.
	#move_and_slide()
func _input(event):

   # Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		if event.is_pressed() == true:
			var ints = bullet.instantiate()
			var actors = get_node("/root/Index/actors")
			actors.add_child(ints)
			ints.position = position
			ints.position += transform.x * 100
			#
			#ints.rotation = 0
			$AudioStreamPlayer.play()
			ints.rotation = rotation
			ints.rotation += 1.57
	#   print("Mouse Click/Unclick at: ", event.position)
	#if event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
		#atan2()
		#print($Camera2D.global_position)
		#print(get_viewport_rect().size)
		#var rot = atan2(get_viewport_rect().size.x - event.position.x, get_viewport_rect().size.y - event.position.y)
		#print(rot)
		#rotation = rot + 0.0
