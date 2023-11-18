extends Control

@onready var plant_selection = $HBoxContainer
@onready var sun_manager = $"../PcComputer-PlantsVsZombies-Day/SunManager"
@export var plant_card: PackedScene = preload("res://UI/PlantCard.tscn")


#var plants_in_game = ["Peashooter","Sunflower"]
var plants_in_game = {
	"Peashooter": 100,
	"Sunflower": 50
}

func _ready():
	for plant in plants_in_game:
		var new_card = plant_card.instantiate()
		var name_of_resource_card_file = "res://Plants/%s/%sCard.png" % [plant,plant]
		var name_of_resource_disabled_card_file = "res://Plants/%s/%sCardDisable.png" % [plant,plant]		
		new_card.texture_normal = load(name_of_resource_card_file)
		new_card.texture_pressed = load(name_of_resource_card_file)		
		new_card.texture_disabled = load(name_of_resource_disabled_card_file)		
		new_card.plant_name = plant
		plant_selection.add_child(new_card)

func _physics_process(_delta):
	print(sun_manager.sun_gathered)
	update_card_state()

func _on_texture_rect_mouse_entered():
	print('mouse enter the card')

func _on_texture_button_button_down():
	print('hold down the card')
	
func update_card_state():
	var plant_cards = plant_selection.get_children()
	for i in len(plant_cards):
		if plants_in_game[plant_cards[i].plant_name] > sun_manager.sun_gathered:
			plant_cards[i].disabled = true
		else:
			plant_cards[i].disabled = false

		

