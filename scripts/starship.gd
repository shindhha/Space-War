extends Area2D
var life = 3
var type = "player"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _input(event):
	if event is InputEventMouseMotion:
		set_position(event.position)
		# event.position contient un Vector2 de la position du curseur dans la scène

func deal_damage():
	return 0
	
func get_damage(damage):
	life -= damage
	if (life == 0):
		hide()
		queue_free()

func _on_area_entered(area):
	life -= area.deal_damage()
	if (life == 0):
		hide()
		queue_free()

func get_type():
	return type
