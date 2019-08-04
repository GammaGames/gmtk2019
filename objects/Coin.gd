extends Area2D

onready var audio = $AudioStreamPlayer2D
signal collected


func _ready():
    connect("body_entered", self, "_body_entered")
    audio.connect("finished", self, "_finished")
    $AnimationPlayer.play("Spin")


func _body_entered(body):
    if visible:
        emit_signal("collected")
        audio.play()
        visible = false
        $CollisionShape2D.disabled = true


func _finished():
    queue_free()
