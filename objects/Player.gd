extends PathFollow2D

onready var ball = preload("res://objects/Ball.tscn")
onready var ray = $RayCast2D
onready var line = $RayCast2D/Line2D
onready var main = $"../.."
var shot = false

signal caught


func _ready():
    $Area2D.connect("body_entered", self, "_body_entered")


func _process(delta):
    if not shot:
        if Input.is_action_pressed("ui_left"):
            unit_offset -= 0.25 * delta
        elif Input.is_action_pressed("ui_right"):
            unit_offset += 0.25 * delta

        unit_offset = fmod(unit_offset, 1.0)
        if unit_offset < 0:
            unit_offset = 1.0 - unit_offset

    if Input.is_action_just_pressed("ui_accept") and not shot:
        shot = true
        var new_ball = ball.instance()
        new_ball.init(get_direction())
        main.add_child(new_ball)
        new_ball.global_position = $Spawner.global_position


func _physics_process(delta):
    line.remove_point(1)
    var point = Vector2(0, 512)
    if ray.is_colliding():
        point = to_local(ray.get_collision_point())
    line.add_point(point)


func get_direction():
    if unit_offset < 0.25:
        return Vector2.DOWN
    elif unit_offset < 0.5:
        return Vector2.LEFT
    elif unit_offset < 0.75:
        return Vector2.UP
    else:
        return Vector2.RIGHT


func _body_entered(body):
    body.direction = Vector2.ZERO
    body.queue_free()
    shot = false
    emit_signal("caught")
