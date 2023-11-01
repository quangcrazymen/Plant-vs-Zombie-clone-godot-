extends Node2D

@export var walking_speed: int = 20
#@onready var zombie_state_machine = $AnimationTree["parameters/playback"]
@onready var eating = $Eating
@onready var walking_sprite = $WalkingSprite
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	eating.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position+= walking_speed*delta*Vector2.LEFT
	pass


func _on_body_area_entered(area):
	print("Zombie gets hit")


func _on_touch_plant_area_entered(area):
	#zombie_state_machine.travel("eating")
	stop_and_eat()
	animation_player.play("eating")
	print("Eating plant....")

func stop_and_eat():
	walking_speed = 0
	eating.visible = true
	walking_sprite.visible = false
