extends "res://objects/Line.gd"


func _ready():
    audio.connect("finished", self, "_finished")


func break():
    visible = false
    audio.play()
    $CollisionShape2D.disabled = true

func _finished():
    queue_free()
