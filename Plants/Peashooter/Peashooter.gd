extends Node2D

@export var bullet_speed: float = 500.0
@export var bullet_direction: Vector2 = Vector2.RIGHT
@export var bullet_wait_time: float = 3.0
@export var bullet_damage: int = 10 
@export var default_health: int = 100
#@onready var bullet = get_child(2)
# Called when the node enters the scene tree for the first time.
@onready var ray_cast_2d = $RayCast2D
@export var bullet: PackedScene
@onready var peashoter_timer = $PeashoterTimer

var health:int = default_health
var beingEaten:bool = false
var can_shoot: bool = false
var is_in_shooting_state: bool = false



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
	if zombie_detected():
		is_in_shooting_state = true
	if zombie_detected() and can_shoot:
		#print('shoot')
		is_in_shooting_state = true

	elif !zombie_detected():
		peashoter_timer.stop()
		is_in_shooting_state = false
		can_shoot = false
	#print("Plant health is %f", health)
#func _physics_process(delta):
#	print('physic process')

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
	#print("shoot")
	shoot()
	can_shoot = false
	pass # Replace with function body.

func zombie_detected() -> bool:
	var c = ray_cast_2d.get_collider()
	if c != null:
		#print(c.is_in_group("zombies"))
		if !is_in_shooting_state:
			Utils.set_and_start_timer(peashoter_timer,0.5,0)
		return c.is_in_group("zombies")
	return false
