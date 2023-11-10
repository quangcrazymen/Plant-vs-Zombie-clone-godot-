extends Node

@onready var plants_vs_zombies_day = $"."
@export var sun_scene: PackedScene = preload("res://GenericObjects/Sun.tscn")
@export var zombie_scene: PackedScene = preload("res://Zombies/regular_zombie.tscn")

@onready var score_label = $NumberOfSuns/ScoreLabel
@onready var sun_manager = $SunManager
@onready var sun_fall_timer = $SunManager/SunFallTimer
@onready var zombie_spawner_timer = $ZombieSpawner/ZombieSpawnerTimer

@onready var is_sun_falling = false
var is_time_to_spawn_zombie: bool = false
var zombie_spawn_positions = [206.0,110.0,30.0,-82.0,-194.0]
# Called when the node enters the scene tree for the first time.
func _ready():
	#sun_scene.instantiate()
	plants_vs_zombies_day.add_child(sun_scene.instantiate())
	print("Hello from falling sun")
	Utils.set_and_start_timer(sun_fall_timer,3.0,0.0)
	Utils.set_and_start_timer(zombie_spawner_timer,3.0,0.0)
	
	for position in zombie_spawn_positions:
		var new_zombie = zombie_scene.instantiate()
		new_zombie.position = Vector2(512.0,position)
		plants_vs_zombies_day.add_child(new_zombie)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_sun_falling:
		var new_sun = sun_scene.instantiate()
		new_sun.position.y = -256.0
		new_sun.position.x = randf_range(-500.0,500.0)
		plants_vs_zombies_day.add_child(new_sun)
		is_sun_falling = false
	if is_time_to_spawn_zombie:
		var new_zombie = zombie_scene.instantiate()
		new_zombie.position = Vector2(512.0,zombie_spawn_positions[randi_range(0,4)])
		plants_vs_zombies_day.add_child(new_zombie)		
		is_time_to_spawn_zombie = false
	score_label.text = str(sun_manager.sun_gathered)


func _on_sun_fall_timer_timeout():
	is_sun_falling = true
	Utils.set_and_start_timer(sun_fall_timer,3.0,0.0)
	pass # Replace with function body.


func _on_zombie_spawner_timer_timeout():
	is_time_to_spawn_zombie = true
	Utils.set_and_start_timer(zombie_spawner_timer,3.0,0.0)
