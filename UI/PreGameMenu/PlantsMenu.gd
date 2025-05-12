extends Node
@export var target : Control
@export var curve: Curve

@export var transition_type: Tween.TransitionType

var choose_your_plant: MarginContainer
func _ready() -> void:
	#choose_your_plant = get_node("$VBoxContainer/ChooseYourPlant")
	pass
#func _process(delta):
	#for child in $VBoxContainer/ChooseYourPlant.get_children():
		#if child.is_selectable == false:
			#print("child is selectable")
	

func add_tween(property: String, value, second: float) -> void:
	var tween = get_tree().create_tween()
	var obj = tween.tween_property(self, property, value , second)
	obj.set_trans(transition_type)

func _on_ready() -> void:
	#position
	#add_tween("")
	print(get_window().size)
	add_tween("position", Vector2(self.position.x, get_window().size.y - self.size.y), 1.0)
	#add_tween("scale", Vector2(2.0,2.0), 1.0);
	pass # Replace with function body.
