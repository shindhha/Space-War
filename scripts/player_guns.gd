extends Node2D
@onready var node_root = get_node("/root/World")
var laser_1 = preload("res://prefabs/starshiplaser.tscn")
var laser_2 = preload("res://prefabs/starshiplaser.tscn")
var laser_3 = preload("res://prefabs/starshiplaser.tscn")
var time = 0.3
var nbLaser = 1
var laser_speed = 1
@export var fire = false
@export var y = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	time -= delta
	if time < 0 and fire :
		time = 0.3
		for i in range(0,nbLaser + 1):
			var direction = -1 if i % 2 == 0 else 1
			var node_laser = laser_1.instantiate()
			node_laser.set_position(global_position)
			node_laser.set_scale(Vector2(0.7, 0.7))
			node_laser.set_y_progression(y / nbLaser * direction)
			node_laser.set_x_progression(800)
			node_laser.set_speed(laser_speed)
			node_root.add_child(node_laser)
			

func turnFire(new_fire):
	fire = new_fire
	
func set_y(new_y):
	y = new_y
func set_laser_speed(new_laser_speed):
	laser_speed = new_laser_speed

func set_has_double_laser(new_has_double_laser):
	if (new_has_double_laser):
		nbLaser = 2
	else:
		nbLaser = 1
func set_shot_frequency(shot_frequency):
	time = shot_frequency
