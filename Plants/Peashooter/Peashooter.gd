extends Node2D

@export var bullet_speed: float = 500.0
@export var bullet_direction: Vector2 = Vector2.RIGHT
@export var bullet_wait_time: float = 3.0
@export var default_health: int = 100
@onready var bullet = get_child(2)
# Called when the node enters the scene tree for the first time.

var health:int = default_health

func _ready():
	print(get_child(2).name)
	pass # Replace with function body.

#func start_sho

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bullet!=null and bullet.is_queued_for_deletion() == false:
		bullet.position += bullet_direction*bullet_speed*delta


func _on_plant_body_area_entered(area):
	print("Plant is being eaten")
	pass # Replace with function body.
