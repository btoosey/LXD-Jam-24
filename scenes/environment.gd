extends Node3D

@onready var game_state_machine: GameStateMachine = $GameStateMachine as GameStateMachine
@onready var player = $Player
@onready var companion_fish = $CompanionFish

func _ready():
	game_state_machine.init()

func calc_distance() -> int:
	return clamp(Vector2(player.position.x, player.position.z).distance_to(Vector2(companion_fish.position.x, companion_fish.position.z)), 0, 15)

func _on_round_timer_timeout():
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.END)

func _on_score_interval_timer_timeout():
	GameManager.increase_current_score(15 - calc_distance())

func _on_retry_button_pressed():
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.PLAY)
