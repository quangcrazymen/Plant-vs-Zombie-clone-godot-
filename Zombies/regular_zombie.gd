extends Node2D

@export var walking_speed: int = 10
#@onready var zombie_state_machine = $AnimationTree["parameters/playback"]
@onready var eating = $Eating
@onready var walking_sprite = $WalkingSprite
@onready var animation_player = $AnimationPlayer
var health:int = 50
var start_walking:bool

func _ready():
	eating.visible = false
	start_walking = true

func _process(delta):
	#print(delta)
	position+= walking_speed*delta*Vector2.LEFT
	if health<0:
		set_process(false)
		die()


func _on_body_area_entered(area):
	print("Zombie 
	ts hit, remaining health: {}",health)
	dying()


func _on_touch_plant_area_entered(area):
	#zombie_state_machine.travel("eating")
	stop_and_eat()
	animation_player.play("eating")
	print("Eating plant....")

func stop_and_eat():
	walking_speed = 0
	eating.visible = true
	walking_sprite.visible = false

func start_walking_func():
	walking_speed = 20
	eating.visible = false
	walking_sprite.visible = true

func _on_touch_plant_area_exited(area):
	start_walking = false
	start_walking_func()
	animation_player.play("walking")
	pass # Replace with function body.

func dying():
	health-=10
	
func die():
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
