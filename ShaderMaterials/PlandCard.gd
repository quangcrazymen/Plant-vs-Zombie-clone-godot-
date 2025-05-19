extends MarginContainer

@export var transition_type: Tween.TransitionType
var plant_name

# this is just for testing
var is_selected :bool = false

func _process(delta: float) -> void:
	if is_selected:
		$Button.visible = true

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		#if event.pressed and is_ingameplay:
		if event.pressed:
			var last_child_prop = $"../../../../UpperPanel/HBoxContainer/SelectedPlant".get_children().back()
			var next_card_pos : Vector2 = last_child_prop.global_position + Vector2(last_child_prop.size.x,0.0)
			add_tween("position", next_card_pos - global_position, 0.2).finished.connect(on_tween_finished)			
			
func on_tween_finished() -> void:
	self.reparent($"../../../../UpperPanel/HBoxContainer/SelectedPlant")
	self.is_selected = true
			
func add_tween(property: String, value, second: float) -> Tween:
	var tween = get_tree().create_tween()
	var obj = tween.tween_property(self, property, value , second)
	obj.set_trans(transition_type)
	return tween


func _on_button_button_down() -> void:
	print("On Button Down")
	SignalManager.on_card_clicked.emit(plant_name)
	
func _on_button_button_up() -> void:
	print("On Button Up")
	SignalManager.on_card_released.emit(plant_name)
