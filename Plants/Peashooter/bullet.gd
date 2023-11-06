extends Sprite2D

var _direction: Vector2 = Vector2.UP
var _speed: float = 200.0
var _damage: int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setup(pos: Vector2, dir: Vector2, sp: float, dmg: int) -> void:
	_direction = dir
	_speed = sp
	_damage = dmg
	global_position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += _direction * _speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Bullet has gone out off screen")
	queue_free()


func _on_area_2d_area_entered(area):
	print("hit the zombie")
	pass # Replace with function body.
