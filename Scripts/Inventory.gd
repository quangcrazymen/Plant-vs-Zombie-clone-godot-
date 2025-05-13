extends Node

# for debugging
@export var plant : Texture
var plantCard: PackedScene

var listOfPlants : Array[String] = ["Plantern", "Torchwood", "Squash", "Spikeweed", "Blover", "Starfruit"]
func _ready() -> void:
	for plant in listOfPlants:
		var plantTexPath = "res://Plants/%s/%s.webp" % [plant, plant]
		# preload must be a constant string
		# TODO: Get this of the runtime
		var plantTex: Texture = load(plantTexPath)
		plantCard = preload("res://ShaderMaterials/PlantCard.tscn")
		#plantCard.get_node($VBoxContainer/HBoxContainer/VBoxContainer/TextureRect).texture = plant
		var instance = plantCard.instantiate()
		instance.find_child("PlantTex").texture = plantTex
		self.add_child(instance)
