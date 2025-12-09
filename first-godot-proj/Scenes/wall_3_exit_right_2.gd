extends Area2D


@export var target_spawn:NodePath

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/wall_5.tscn")
