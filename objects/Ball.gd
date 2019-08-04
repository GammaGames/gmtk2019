extends KinematicBody2D

onready var visibility = $VisibilityNotifier2D
var direction = Vector2.ZERO
var speed = 10


func _ready():
    $Timer.connect("timeout", self, "_timeout")
    visibility.connect("viewport_exited", self, "_viewport_exited")


func init(dir):
    direction = dir


func queue_free():
    visibility.disconnect("viewport_exited", self, "_viewport_exited")
    .queue_free()


func _physics_process(delta):
    var collision_info = move_and_collide(direction * speed)
    if collision_info:
        direction = direction.bounce(collision_info.normal)
        if collision_info.collider.has_method("play"):
            collision_info.collider.play()
        if collision_info.collider.has_method("break"):
            collision_info.collider.break()


func _timeout():
    $"../Gui".show_restart()


func _viewport_exited(viewport):
    if not visibility.is_on_screen():
        $"../Gui".show_restart()
        $"../Lose".play()
