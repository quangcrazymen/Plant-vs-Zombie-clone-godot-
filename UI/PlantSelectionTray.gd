extends Control

@onready var plantsSelection = $HBoxContainer
@onready var sun_manager = $"../PcComputer-PlantsVsZombies-Day/SunManager"
@export var plant_card: PackedScene = preload("res://UI/PlantCard.tscn")
# Called when the node enters the scene tree for the first time.

var plant_in_game = ["Peashooter","Sunflower"]
func _ready():
	for plant in plant_in_game:
		var new_card = plant_card.instantiate()
		var name_of_resource_card_file = "res://Plants/%s/%sCard.png" % [plant,plant]
		var name_of_resource_disabled_card_file = "res://Plants/%s/%sCardDisable.png" % [plant,plant]		
		new_card.texture_normal = load(name_of_resource_card_file)
		new_card.texture_pressed = load(name_of_resource_card_file)		
		new_card.texture_disabled = load(name_of_resource_disabled_card_file)		
		new_card.plant_name = plant
		plantsSelection.add_child(new_card)
	
func _process(delta):
#	if sun_manager.sun_gathered <100:
#		pea_shooter_card.disabled = true
#	else:
#		pea_shooter_card.disabled = false
	pass
# Create draggable object: https://www.youtube.com/watch?v=uhgswVkYp0o


func _on_texture_rect_mouse_entered():
	print('mouse enter the card')


func _on_texture_button_button_down():
	print('hold down the card')
