extends Node2D

@onready var initial_camera_limiter = $CameraLimiters/CameraLimiter1
@onready var player: Player = $Player

func _ready():
	player.camera.camera_limit_manager.set_limiter(initial_camera_limiter, true)
	$AnimationPlayer.play("moving_cloud")
