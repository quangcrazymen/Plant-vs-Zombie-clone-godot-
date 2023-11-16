extends TextureButton

class_name PlantCard

var plant_name
func _ready():
	#texture_normal = load("res://Plants/Peashooter/peashooterCard.png")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_down():
	SignalManager.on_card_clicked.emit(plant_name)

func _on_button_up():
	SignalManager.on_card_released.emit(plant_name)
