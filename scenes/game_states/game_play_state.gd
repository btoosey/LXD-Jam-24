extends GameState

@onready var score_interval_timer = $"../../Timers/ScoreIntervalTimer"
@onready var round_timer = $"../../Timers/RoundTimer"
@onready var player = $"../../Player"
@onready var companion_fish = $"../../CompanionFish"
@onready var countdown_label = $"../../UI/CountdownLabel"
@onready var labels = $"../../Labels"

func enter():
	GameManager.reset_current_score()
	
	await get_tree().create_timer(2).timeout
	labels.visible = true
	countdown_label.text = "3"
	await get_tree().create_timer(1).timeout
	countdown_label.text = "2"
	await get_tree().create_timer(1).timeout
	countdown_label.text = "1"
	await get_tree().create_timer(1).timeout
	countdown_label.text = "GO!"

	score_interval_timer.start()
	round_timer.start()
	player.active = true
	companion_fish.active = true

	await get_tree().create_timer(1).timeout
	countdown_label.text = ""

func exit():
	score_interval_timer.stop()
	player.active = false
	companion_fish.active = false
