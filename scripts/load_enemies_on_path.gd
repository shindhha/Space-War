extends Path2D

@export var enemie_number:int = 20
@export var Enemy:Resource = preload("res://prefabs/enemie_path_follow.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range (enemie_number): # Replace with function body.
		var node_enemy = Enemy.instantiate()
		node_enemy.set_progress(100 * i)
		add_child(node_enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
