extends Node
@export var target : Control
@export var curve: Curve

@export var transition_type: Tween.TransitionType

var choose_your_plant: MarginContainer
var original_position : Vector2

func _ready() -> void:
	pass

func add_tween(property: String, value, second: float) -> void:
	var tween = get_tree().create_tween()
	var obj = tween.tween_property(self, property, value , second)
	obj.set_trans(transition_type)

func move_back_to_original_pos():
	add_tween("position", Vector2(self.position.x, original_position.y), 0.5)

func _on_ready() -> void:
	original_position = self.position
	var transitionTime = 1.0
	add_tween("position", Vector2(self.position.x, get_window().size.y - self.size.y), 1.0)
	#SignalManager.gameStateChanged.connect(Callable(self,"move_back_to_original_pos"))
	#await get_tree().create_timer(transitionTime)

func _on_lets_rock_pressed() -> void:
	SignalManager.gameStateChanged.emit(GameManager.GameState.ACTION_PHASE)
	move_back_to_original_pos()
