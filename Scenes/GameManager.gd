extends Node
class_name GameManager
enum GameState {PREGAME, ACTION_PHASE, POSTGAME}

@export var CurrentGameState : GameState = GameState.PREGAME
@export var mainCamera : Camera2D

func changeGameState(gameState: GameState):
	if CurrentGameState == gameState:
		return
	CurrentGameState = gameState
	print("GameState has changed to %s" % [gameState])
	match CurrentGameState:
		GameState.ACTION_PHASE:
			mainCamera.position.x -= 200.0

func _ready() -> void:
	var caller = Callable(self,"changeGameState")
	#caller.bind(GameState.ACTION_PHASE)
	SignalManager.gameStateChanged.connect(caller)

#func _process(delta: float) -> void:
