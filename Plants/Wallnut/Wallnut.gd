extends Node2D

var health :int= 1000
var beingEaten:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if beingEaten:
		dying(delta)
	if health < 0:
		die()	
		
func dying(delta):
	health-=delta*100

func die():
	queue_free()

func _on_plant_body_area_entered(area):
	beingEaten = true
