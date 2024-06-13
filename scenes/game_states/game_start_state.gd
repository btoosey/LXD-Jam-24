extends GameState
@onready var camera_3d = $"../../Camera3D"
@onready var title = $"../../UI/Title"
@onready var start_button = $"../../UI/StartButton"
@onready var subtitle = $"../../UI/Subtitle"

func exit():
	var camera_tween = get_tree().create_tween()
	camera_tween.tween_property(camera_3d, "rotation:x", -0.87, 3)

	var ui_tween = get_tree().create_tween()
	ui_tween.tween_property(title, "position:y", -500, 3)
	
	start_button.disabled = true
	start_button.visible = false
	subtitle.visible = false
