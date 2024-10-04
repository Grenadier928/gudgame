extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true
	max_contacts_reported = 5
	pass # Replace with function body.
func body_shape_entered(body):
	print(body)
	
	
func _physics_process(delta):
	#add_constant_central_force(Vector2(0.0,.9))
	#set_axis_velocity( Vector2(0.0,6) )
	set_axis_velocity(transform.y * -500)
	#print("a")
	#linear_velocity = Vector2(0.0,.9)
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_body_entered(body):
	#print("B")
	if body.name == str("Enemy"):
		print(body)
		body._on_die()
		#connect("die", body._on_die)
		#body.emit_signal('die', 0)
	queue_free()
	pass # Replace with function body.
