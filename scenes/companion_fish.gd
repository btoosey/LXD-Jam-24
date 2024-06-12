extends CharacterBody3D

var target_position: Vector3
const SPEED: float = 5
@onready var timer = $Timer

func _ready():
	choose_target()
	timer.start()

func _physics_process(delta):
	if target_position == null:
		position = target_position

	var direction = global_position.direction_to(target_position)
	velocity = direction * SPEED
	move_and_slide()

func choose_target() -> void:
	print("target")

func _on_timer_timeout():
	choose_target()
