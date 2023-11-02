extends Area2D
@onready var node_life_bar = get_node("/root/World/life_bar/Polygon2D")
@onready var node_level_bar = get_node("/root/World/level_bar/Polygon2D")
var center_gun
var left_gun
var right_gun
var shield
var life = 3
var has_shield = false
@export var level = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	center_gun = get_node("guncenter")
	left_gun = get_node("gunleft")
	right_gun = get_node("gunright")
	shield = get_node("shield")
	center_gun.turnFire(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	


func _input(event):
	if event is InputEventMouseMotion:
		set_position(event.position)
		# event.position contient un Vector2 de la position du curseur dans la scène

func deal_damage():
	return 0
	


func _on_area_entered(area):
	area.update_spaceship(self)
	if (level >= 2):
		left_gun.turnFire(true)
		right_gun.turnFire(true)
		
	if (level >= 4):
		left_gun.set_laser_speed(2)
		right_gun.set_laser_speed(2)
		center_gun.set_laser_speed(2)
	if (level >= 6):
		left_gun.set_shot_frequency(0.1)
		right_gun.set_shot_frequency(0.1)
		center_gun.set_shot_frequency(0.1)
	
	if (level >= 8):
		left_gun.set_has_double_laser(true)
		right_gun.set_has_double_laser(true)
	
	area._destroy()
	node_life_bar.set_offset(Vector2(life * 61 - 183,0))
	node_level_bar.set_offset(Vector2(level * 35 -390,0))
		
	if (life <= 0):
		_destroy()

func increase_life(heal):
	if (life + heal >= 3):
		life = 3
	else:
		life += heal

func decrease_life(damage):
	if (life - damage <= 0):
		life = 0
	else:
		life -= damage

func enable_shield():
	shield.visible = true
	has_shield = true
	
func increase_level():
	if (level + 1 > 9):
		level = 9
	else:
		level += 1

func disable_shield():
	shield.visible = false
	has_shield = false

func is_protected():
	return has_shield

func _destroy():
	hide()
	queue_free()

