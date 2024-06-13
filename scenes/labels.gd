extends Control

@onready var environment = $".."
@onready var distance_label = $DistanceLabel
@onready var score_label = $ScoreLabel


func _process(_delta):
	distance_label.text = "Distance: " + str(environment.calc_distance())
	score_label.text = "Score: " + str(GameManager.current_score)
