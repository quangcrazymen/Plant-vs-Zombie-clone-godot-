extends Node2D

@export var sun_scene:PackedScene = preload("res://GenericObjects/Sun.tscn")
@onready var sunflower_timer = $SunflowerTimer

var health:int = 100
var beingEaten:bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Utils.set_and_start_timer(sunflower_timer,5.,0)
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

func _on_sunflower_timer_timeout():
	produce_sun()
	
func produce_sun():
	var new_sun = sun_scene.instantiate()
	get_tree().current_scene.add_child(new_sun)
	new_sun.global_position = global_position
