extends Node2D

class_name CardManager
@onready var pc_computer_plants_vs_zombies_day = $".."
@onready var grid_map = $"../GridMap"
@export var peashooter: PackedScene = preload("res://Plants/Peashooter/Peashooter.tscn")
@onready var plant_selection = $"../../PlantSelection"
@onready var sun_manager = $"../SunManager"

@export var plant_image_res: PackedScene
var plant_image

func _ready():
	SignalManager.on_card_clicked.connect(on_card_clicked)
	SignalManager.on_card_released.connect(on_card_released)
	const text = "Peashooter"
	var filename = "res://Plants/%s/%sImage.tscn" % [text,text]
	plant_image_res = load(filename)	

func _process(delta):
	if plant_image:
		plant_image.position = get_global_mouse_position()

func on_card_clicked(text):
	plant_image = plant_image_res.instantiate()
	plant_image.get_child(0).texture = load("res://Plants/%s/%sImage.png"%[text,text])
	plant_image.position = get_global_mouse_position()
	pc_computer_plants_vs_zombies_day.add_child(plant_image)
	
func on_card_released(plant_name):
	for tile in grid_map.get_children():
		if tile.on_chosen and !tile.is_occupied:
			var plant: PackedScene = load("res://Plants/%s/%s.tscn" % [plant_name,plant_name])
			var instance = plant.instantiate()
			tile.is_occupied = true
			tile.add_child(instance)
			# spend sun
			sun_manager.sun_gathered -= plant_selection.plants_in_game[plant_name]
	pc_computer_plants_vs_zombies_day.remove_child(plant_image)

#func spawn(spawn_global_position):
#	var instance = peashooter.instantiate()
#	instance.global_position = spawn_global_position
#	grid_map.add_child(instance)
