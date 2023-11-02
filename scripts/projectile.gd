extends Area2D
var time = 0.3
var damage = 10
var y = 0
var x = 800
var speed = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_position(get_position() + (Vector2.RIGHT * delta * x * speed) + (Vector2.UP * delta * y * speed) )

		
func _destroy():
	
	hide()
	queue_free()

func deal_damage():
	return damage

func set_y_progression(new_y):
	y = new_y

func set_x_progression(new_x):
	x = new_x
func set_speed(new_speed):
	speed = new_speed

