extends Node
var target : Control
@export var curve: Curve

@export var transition_type: Tween.TransitionType

func add_tween(property: String, value, second: float) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(target, property, value , second).set_trans(transition_type)
