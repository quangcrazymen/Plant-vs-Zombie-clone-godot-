extends Node2D

@export var animation_tree: AnimationTree
@export var animation_player: AnimationPlayer
@export var corn_bullet: Polygon2D

var state_machine
var is_corn_flying: bool
var current_target: Vector2
var corn_original_pos: Vector2

var target_to_hit_scene : PackedScene
var temp: float

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()

func _ready():
	state_machine = animation_tree["parameters/playback"]
	animation_tree.set("parameters/conditions/idle", true)
	is_corn_flying = false
	corn_original_pos = corn_bullet.position
	target_to_hit_scene = preload("res://Debug/debug_target_to_hit.tscn")
	var instance: Sprite2D = target_to_hit_scene.instantiate()
	current_target = Vector2(position.x + 400, position.y)
	instance.position = current_target
	add_child(instance)

func _process(delta):
	if Input.is_action_pressed("kernelpult-fire"):
		print("press kernel-pult fire")
		animation_tree.set("parameters/conditions/fire",true)
		is_corn_flying = true
		var anim_length = animation_player.get_animation("fire").length
		await get_tree().create_timer(anim_length).timeout
		animation_tree.set("parameters/conditions/fire",false)
	if is_corn_flying:
		var midpoint:Vector2 = Vector2((position.x + current_target.x) / 2,position.y - 400)
		temp += delta
		var corn_pos = _quadratic_bezier(corn_original_pos, midpoint,current_target,temp)
		corn_bullet.set_position(corn_pos)
	if temp > 1:
		temp = 0
		is_corn_flying = false

func _quadratic_bezier(p0: Vector2, p1: Vector2, p2: Vector2, t: float) -> Vector2:
	var q0 = p0.lerp(p1, t)
	var q1 = p1.lerp(p2, t)
	
	var r = q0.lerp(q1,t)
	return r
