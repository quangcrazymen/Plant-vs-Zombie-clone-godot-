extends Node

@onready var plants_vs_zombies_day = $"."
@export var sun_scene: PackedScene = preload("res://GenericObjects/Sun.tscn")
@onready var score_label = $NumberOfSuns/ScoreLabel
@onready var sun_manager = $SunManager

# Called when the node enters the scene tree for the first time.
func _ready():
	#sun_scene.instantiate()
	plants_vs_zombies_day.add_child(sun_scene.instantiate())
	print("Hello from falling sun")
	#print(get_tree().current_scene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(randf_range(100.0,200.0))
	score_label.text = str(sun_manager.sun_gathered)
	
