extends PanelContainer

@export var transition_type: Tween.TransitionType
@export var selectedPlant: HBoxContainer

func add_tween(property: String, value, second: float) -> void:
	var tween = get_tree().create_tween()
	var obj = tween.tween_property(self, property, value , second)
	obj.set_trans(transition_type)
	
func _ready() -> void:
	print(get_window().size)
	add_tween("position", Vector2(self.position.x, 0), 1.0)
