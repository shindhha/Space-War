extends Area2D

var heal = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _destroy():
	hide()
	queue_free()
func update_spaceship(spaceship):
	spaceship.increase_life(heal)


