extends Control

@onready var plantsSelection = $HBoxContainer
@onready var sprite_2d = $HBoxContainer/Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,4):
		plantsSelection.add_child(sprite_2d)
		print("Hello")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Create draggable object: https://www.youtube.com/watch?v=uhgswVkYp0o


func _on_texture_rect_mouse_entered():
	print('mouse enter the card')


func _on_texture_button_button_down():
	print('hold down the card')
