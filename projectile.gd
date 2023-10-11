extends Area2D
var time = 0.3
var damage = 1
var type = "projectile"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_position(get_position() + Vector2.UP.rotated(get_rotation()) * delta * 800 )

		
func _destroy():
	
	hide()
	queue_free()

func deal_damage():
	return damage

func get_type():
	return type

