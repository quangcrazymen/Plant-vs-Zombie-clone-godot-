extends MarginContainer

@export var transition_type: Tween.TransitionType

# this is just for testing
var is_selectable :bool = true
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			is_selectable = !is_selectable
			var selected_position: Vector2 = $"../../../../UpperPanel/HBoxContainer/SelectedPlant".global_position
			add_tween("position", selected_position - global_position, 0.5).finished.connect(on_tween_finished)
			
func on_tween_finished() -> void:
	self.reparent($"../../../../UpperPanel/HBoxContainer/SelectedPlant")
			
func add_tween(property: String, value, second: float) -> Tween:
	var tween = get_tree().create_tween()
	var obj = tween.tween_property(self, property, value , second)
	obj.set_trans(transition_type)
	return tween
