extends Node

var current_score: int = 0
var high_score: int = 0

func increase_current_score(value) -> void:
	current_score += value

func update_highscore() -> void:
	if current_score > high_score:
		high_score = current_score

func reset_current_score() -> void:
	current_score = 0
