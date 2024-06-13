extends GameState

@onready var retry_button = $"../../UI/RetryButton"

func enter():
	GameManager.update_highscore()
	retry_button.visible = true
	
func exit():
	retry_button.visible = false
