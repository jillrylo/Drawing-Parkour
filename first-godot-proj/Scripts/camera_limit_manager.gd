extends Node2D

class_name CameraLimitManager

@export var limit_transition_speed = 3

const MAX_LIMIT = 100000

var camera_bounds_x_min
var camera_bounds_x_max
var camera_bounds_y_min
var camera_bounds_y_max

var limit_left_target: float = -MAX_LIMIT
var limit_right_target: float = MAX_LIMIT
var limit_top_target: float = -MAX_LIMIT
var limit_bottom_target: float = MAX_LIMIT

func _ready():
	var camera_bounds = get_viewport_rect()
	camera_bounds_x_min = camera_bounds.position.x
	camera_bounds_y_min = camera_bounds.position.y
	camera_bounds_x_max = camera_bounds.end.x
	camera_bounds_y_max = camera_bounds.end.y
	
func set_limiter(limiter: CameraLimiter, instant = false):
