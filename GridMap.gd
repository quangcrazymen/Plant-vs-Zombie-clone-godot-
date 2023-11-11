extends Area2D

@export var tile_scene: PackedScene = preload("res://GenericObjects/Tile.tscn")
@onready var grid_map = $"."

func _ready():
	initialize_the_board()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func initialize_the_board():
	var first_tile_pos : Vector2 = Vector2(-403,-172)
	for i in range(0,5):
		for j in range(0,9):
			var new_tile = tile_scene.instantiate()
			new_tile.position = Vector2(first_tile_pos.x + j*80.0,
						first_tile_pos.y + i*100.0)
			grid_map.add_child(new_tile)
			
func _on_area_entered(area):
	print(area.name)
	var children:Array = get_children()
	pass # Replace with function body.
