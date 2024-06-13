extends Control

@onready var environment = $".."
@onready var distance_label = $DistanceLabel
@onready var score_label = $ScoreLabel
@onready var high_score_label = $HighScoreLabel
@onready var timer_label = $TimerLabel
@onready var round_timer = $"../Timers/RoundTimer"

func _process(_delta):
	distance_label.text = "Distance from other fish: " + str(environment.calc_distance())
	score_label.text = "Score: " + str(GameManager.current_score)
	high_score_label.text = "Highscore: " + str(GameManager.high_score)
	timer_label.text = "Time Left: " + str(snapped(round_timer.time_left, 0.01))
