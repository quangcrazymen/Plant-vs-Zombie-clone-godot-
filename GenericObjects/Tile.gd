extends Node2D

class_name Tile

var on_chosen = false
var is_occupied = false

func _on_area_2d_area_entered(area):
	on_chosen = true
	
func _on_area_2d_area_exited(area):
	on_chosen = false

func _on_area_2d_mouse_entered() -> void:
	print("Node: %s, Local Position %s, Global position %s" % [self.name, position,global_position])
