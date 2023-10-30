extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect to the input_event signal	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	print(name)
