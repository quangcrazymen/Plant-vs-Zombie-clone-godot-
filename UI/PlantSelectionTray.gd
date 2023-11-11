extends Control

@onready var plantsSelection = $HBoxContainer
@onready var sun_manager = $"../PcComputer-PlantsVsZombies-Day/SunManager"
@export var plant_card: PackedScene = preload("res://UI/PlantCard.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,4):
		var new_card = plant_card.instantiate()
		#new_card.disabled =true
		plantsSelection.add_child(new_card)
		print("Hello")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
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
