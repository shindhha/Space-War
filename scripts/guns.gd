extends Node2D
@onready var node_root = get_node("/root/World")
var laser = preload("res://prefabs/starshiplaser.tscn")
var time = 0.3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	

	time -= delta
	if time < 0:
		time = 0.3
		var node_laser = laser.instantiate()
		node_laser.set_position(global_position)
		node_laser.set_scale(Vector2(0.7, 0.7))
		node_root.add_child(node_laser)
