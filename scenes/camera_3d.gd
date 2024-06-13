extends Camera3D
@onready var player = $"../Player"

func _ready():
	pass

func _process(_delta):
	position = player.position + Vector3(0,13,-13)
