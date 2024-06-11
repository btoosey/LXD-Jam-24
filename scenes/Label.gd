extends Label

@onready var player = $"../Player"
@onready var companion_fish = $"../CompanionFish"

func _process(_delta):
	text = "Distance: " + str(clamp(round(Vector2(player.position.x, player.position.z).distance_to(Vector2(companion_fish.position.x, companion_fish.position.z))) - 2, 0, 10))
