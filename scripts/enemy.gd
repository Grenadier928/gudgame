extends CharacterBody2D
signal die(int)

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	connect("die", self._on_die)
	
func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
	#	velocity.y += gravity * delta
	var player = get_node("/root/Index/actors/evan")
	var normal_to_evan = (self.global_position - player.global_position).normalized()
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	velocity = -normal_to_evan * 50
	#print(normal_to_evan)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_die():
	print("A")
	$AudioStreamPlayer.play()
	await get_tree().create_timer(.2).timeout
	queue_free()
