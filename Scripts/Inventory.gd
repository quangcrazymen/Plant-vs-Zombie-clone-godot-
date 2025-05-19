extends Node

# for debugging
@export var plant : Texture
var plantCard: PackedScene

var listOfPlants : Array[String] = ["Cherry-bomb", "Plantern", "Torchwood", "Squash", "Spikeweed", "Blover", "Starfruit", "Peashooter"]
func _ready() -> void:
	for plant in listOfPlants:
		var plantTexPath = "res://Plants/%s/%s.webp" % [plant, plant]
		# preload must be a constant string
		# TODO: Get this of the runtime
		var plantTex: Texture = load(plantTexPath)
		plantCard = preload("uid://cxk052aer2hhw") # PlantCard.tscn
		#plantCard.get_node($VBoxContainer/HBoxContainer/VBoxContainer/TextureRect).texture = plant
		var instance = plantCard.instantiate()
		instance.find_child("PlantTex").texture = plantTex
		instance.plant_name = plant
		self.add_child(instance)
