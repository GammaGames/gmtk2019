extends PathFollow2D

onready var ball = preload("res://objects/Ball.tscn")

func _process(delta):
    if Input.is_action_pressed("ui_left"):
        unit_offset -= 0.25 * delta
    elif Input.is_action_pressed("ui_right"):
        unit_offset += 0.25 * delta

    if Input.is_action_just_pressed("ui_accept"):
        pass
