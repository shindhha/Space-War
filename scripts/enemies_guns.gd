extends Node2D
@onready var node_root = get_node("/root/World")
var laser = preload("res://prefabs/laser_enemy.tscn")
@export var time_laser_min = 0.3
@export var time_laser_max = 0.8
var rd = RandomNumberGenerator.new()
var time_laser = rd.randf_range(time_laser_min,time_laser_max)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_laser -= delta
	if time_laser < 0:
		time_laser = 0.3
		var node_laser = laser.instantiate()
		node_laser.set_position(global_position)
		node_laser.set_scale(Vector2(0.7, 0.7))
		node_root.add_child(node_laser)
