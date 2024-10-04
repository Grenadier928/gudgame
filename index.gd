extends Node2D

var timer = 0 
var llama = preload("res://scenes/enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer+=1
	if timer > 100:
		timer = 0
		#print("New llama")
		var rng = RandomNumberGenerator.new()
		var player = get_node("/root/Index/actors/evan")
		var ints = llama.instantiate()
		
		var actors = get_node("/root/Index/actors")
		actors.add_child(ints)
		#print("AAAAA")
		#print(ints)
		ints.position = player.global_position + Vector2(rng.randf_range(-500.0, 500.0), rng.randf_range(-500.0, 500.0))
		pass
