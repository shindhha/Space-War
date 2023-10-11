extends Area2D
@onready var node_life_bar = get_node("/root/World/life_bar/Polygon2D")
@onready var node_level_bar = get_node("/root/World/level_bar/Polygon2D")
var life = 3
var level = 1
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
	


func _on_area_entered(area):
	var damage = area.deal_damage()
	if (life - damage >= 0 and life - damage <= 3  ):
		life -= damage
		
	if (level < 9):
		level += area.give_xp()
	area._destroy()
	node_life_bar.set_offset(Vector2(life * 61 - 183,0))
	node_level_bar.set_offset(Vector2(level * 35.3 -400,0))
		
	if (life <= 0):
		_destroy()

func _destroy():
	hide()
	queue_free()

