extends CharacterBody2D

class_name Player
const SPEED = 300.0
const JUMP_VELOCITY = -600.0

@onready var _animated_sprite = $AnimatedSprite2D
@onready var camera: Camera = $Camera

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AudioStreamPlayer.play()
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if not is_on_floor():
		if velocity.y < 0:
			_animated_sprite.play("jump")
		else:
			_animated_sprite.stop()
			
	elif direction !=0: 
		_animated_sprite.play("walk")
		_animated_sprite.flip_h = direction < 0
	else:
		_animated_sprite.stop()


	move_and_slide()
	
