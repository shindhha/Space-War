extends Area2D

var damage = -1
var xp = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func deal_damage():
	return damage

func _destroy():
	
	hide()
	queue_free()

func give_xp():
	return xp
