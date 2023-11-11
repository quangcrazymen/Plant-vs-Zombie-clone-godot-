extends Node2D

class_name CardManager
@onready var pc_computer_plants_vs_zombies_day = $".."
@export var plant_image_res: PackedScene = preload("res://Plants/Peashooter/PeashooterImage.tscn")
@onready var grid_map = $"../GridMap"
@export var peashooter: PackedScene = preload("res://Plants/Peashooter/Peashooter.tscn")


var plant_image 
func _ready():
	SignalManager.on_card_clicked.connect(on_card_clicked)
	SignalManager.on_card_released.connect(on_card_released)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if plant_image:
		plant_image.position = get_global_mouse_position()

func on_card_clicked():
	plant_image = plant_image_res.instantiate()
	plant_image.position = get_global_mouse_position()
	pc_computer_plants_vs_zombies_day.add_child(plant_image)
	
func on_card_released():
	for tile in grid_map.get_children():
		if tile.on_chosen == true:
			var instance = peashooter.instantiate()
			tile.add_child(instance)
	pc_computer_plants_vs_zombies_day.remove_child(plant_image)

#func spawn(spawn_global_position):
#	var instance = peashooter.instantiate()
#	instance.global_position = spawn_global_position
#	grid_map.add_child(instance)
