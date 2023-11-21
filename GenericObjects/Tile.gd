extends Node2D

class_name Tile

var on_chosen = false
var is_occupied = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	on_chosen = true
	
func _on_area_2d_area_exited(area):
	on_chosen = false
