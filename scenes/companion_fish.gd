extends CharacterBody3D

var target_position: Vector3
var active: bool = false
const SPEED: float = 7
@onready var timer = $Timer
@onready var target_position_raycast = $TargetPositionRaycast

func _ready():
	choose_target()
	timer.start()

func _physics_process(_delta):
	if target_position == null:
		position = target_position

	var direction = global_position.direction_to(target_position)
	velocity = direction * SPEED
	
	if active:
		move_and_slide()

	if position.distance_to(target_position) <= 0.1:
		target_position = position

func choose_target() -> void:

	var rand_direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized() * 10

	var temp_target_position = position + Vector3(rand_direction.x, 0, rand_direction.y)

	target_position_raycast.position = temp_target_position
	target_position_raycast.target_position = temp_target_position + Vector3(0, -5, 0)
	target_position_raycast.debug_shape_custom_color = Color.BLUE
	target_position = temp_target_position
	look_at(target_position, Vector3.UP)

func _on_timer_timeout():
	choose_target()
