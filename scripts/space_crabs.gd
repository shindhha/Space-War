extends Area2D
var life = 5
var damage = 3
@onready var health_bar = $"../TextureProgressBar"
var item_life = preload("res://prefabs/item_life.tscn")
var item_level = preload("res://prefabs/item_level.tscn")
var item_shield = preload("res://prefabs/item_shield.tscn")
@onready var node_root = get_node("/root/World")
var rd = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	health_bar.set_max(life)
	health_bar.set_value(life) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_spaceship(spaceship):
	if not spaceship.is_protected():
		spaceship.decrease_life(damage)
	else:
		spaceship.disable_shield()



func _on_area_entered(area):
	life -= area.deal_damage()
	area._destroy()
	health_bar.set_value(life)
	
	if (life <= 0):
		var node = null
		var rd_number = rd.randf_range(0,1)
		if (rd_number <= 0.15):
			node = item_level.instantiate()
			node.set_position(global_position)
			node_root.add_child(node)
		elif (rd_number <= 0.30 ):
			node = item_life.instantiate()
			node.set_position(global_position)
			node_root.add_child(node)
		elif (rd_number <= 0.45 ):
			node = item_shield.instantiate()
			node.set_position(global_position)
			node_root.add_child(node)
			
		
		_destroy()
func decrease_life(damage):
	life -= damage		

func _destroy():
	health_bar.hide()
	health_bar.queue_free()
	hide()
	queue_free()


