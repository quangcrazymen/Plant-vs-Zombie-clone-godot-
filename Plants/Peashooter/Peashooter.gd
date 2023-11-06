extends Node2D

@export var bullet_speed: float = 500.0
@export var bullet_direction: Vector2 = Vector2.RIGHT
@export var bullet_wait_time: float = 3.0
@export var bullet_damage: int = 10 
@export var default_health: int = 100
#@onready var bullet = get_child(2)
# Called when the node enters the scene tree for the first time.
@export var bullet: PackedScene

var health:int = default_health
var beingEaten:bool = false

func _ready():
	#print(get_child(2).name)
	pass # Replace with function body.

#func start_sho

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if bullet!=null and bullet.is_queued_for_deletion() == false:
#		bullet.position += bullet_direction*bullet_speed*delta
	#shoot()
	if beingEaten:
		dying(delta)
	if health < 0:
		die()
	#print("Plant health is %f", health)


func _on_plant_body_area_entered(area):
	print("Plant is being eaten")
	beingEaten = true
	pass # Replace with function body.
	
func shoot():
	var b = bullet.instantiate()
	b.setup(
		global_position,
		bullet_direction,
		bullet_speed,
		bullet_damage
	)
	get_tree().current_scene.add_child(b)
	
func dying(delta):
	health-=delta*100
	
func die():
	queue_free()

func _on_peashoter_timer_timeout():
	print("shoot")
	shoot()
	pass # Replace with function body.
