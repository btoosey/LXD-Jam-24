extends Camera3D
@onready var player = $"../Player"

func _ready():
	pass

func _process(delta):
	position = player.position + Vector3(0,10,10)
