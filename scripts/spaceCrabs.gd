extends Area2D
var life = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func deal_damage():
	return 3

func _on_area_entered(area):
	if (area.get_type() == "projectile" ):
		area._destroy()
		
		
	life -= area.deal_damage()
	if (life == 0):
		hide()
		queue_free()


