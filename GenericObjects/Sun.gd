extends RigidBody2D

class_name Sun

# Called when the node enters the scene tree for the first time.
func _ready():
#	SignalManager.on_sun_clicked = 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click") == true:
		print('Clicked on the sun')
		SignalManager.on_sun_clicked.emit()
#		queue_free()

