extends CharacterBody3D

const BODY_HEIGHT: float = 1.5
const SPEED: float = 5

var mouse_position: Vector2
var target_position: Vector3
@onready var camera_3d = $"../Camera3D"

func _physics_process(_delta: float) -> void:
	if target_position == null:
		position = Vector3(0,BODY_HEIGHT,0)

	var direction = global_position.direction_to(target_position)
	velocity = direction * SPEED
	move_and_slide()

	if position.distance_to(target_position) <= 0.1:
		target_position = position

func _input(event):
	if event.is_action_pressed("mouse_left"):
		shoot_ray()

func shoot_ray() -> void:
	mouse_position  = get_viewport().get_mouse_position()
	var ray_length = 1000
	var from = camera_3d.project_ray_origin(mouse_position)
	var to = from + camera_3d.project_ray_normal(mouse_position) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	var raycast_result = space.intersect_ray(ray_query)
	
	if raycast_result["collider"].is_in_group("Obstacle"):
		return
	else:
		target_position = raycast_result["position"] + Vector3(0,BODY_HEIGHT,0)
		look_at(target_position, Vector3.UP)
