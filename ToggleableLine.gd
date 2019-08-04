extends "res://objects/Line.gd"

export(bool) var default = true
var enabled
var hit = false


func _ready():
    enabled = default
    call_deferred("display")


func _caught():
    enabled = not enabled
    call_deferred("display")


func display():
    if enabled:
        $CollisionShape2D.disabled = false
        modulate.a = 1.0
    else:
        $CollisionShape2D.disabled = true
        modulate.a = 0.25
