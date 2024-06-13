extends GameState

func enter():
	await get_tree().create_timer(1).timeout
	transition_requested.emit(self, GameState.State.PLAY)
