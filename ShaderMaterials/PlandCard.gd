extends MarginContainer

@export var transition_type: Tween.TransitionType

# this is just for testing
var is_selectable :bool = true
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			is_selectable = !is_selectable
			#var selected_position: Vector2 = $"../../../../UpperPanel/HBoxContainer/SelectedPlant".global_position
			var last_child_prop = $"../../../../UpperPanel/HBoxContainer/SelectedPlant".get_children().back()
			var next_card_pos : Vector2 = last_child_prop.global_position + Vector2(last_child_prop.size.x,0.0)
			add_tween("position", next_card_pos - global_position, 0.2).finished.connect(on_tween_finished)			
			
func on_tween_finished() -> void:
	self.reparent($"../../../../UpperPanel/HBoxContainer/SelectedPlant")
			
func add_tween(property: String, value, second: float) -> Tween:
	var tween = get_tree().create_tween()
	var obj = tween.tween_property(self, property, value , second)
	obj.set_trans(transition_type)
	return tween
