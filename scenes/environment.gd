extends Node3D

@onready var player = $Player
@onready var companion_fish = $CompanionFish

func _on_timer_timeout():
	GameManager.increase_current_score(15 - calc_distance())

func calc_distance() -> int:
	return clamp(Vector2(player.position.x, player.position.z).distance_to(Vector2(companion_fish.position.x, companion_fish.position.z)), 0, 15)
