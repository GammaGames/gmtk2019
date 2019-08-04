extends Node2D


var coins = 0


func _ready():
    $Win.connect("finished", self, "_finished")
    $Path2D/Player.connect("caught", self, "_caught")
    for coin in $Coins.get_children():
        coin.connect("collected", self, "_collected")
        coins += 1
    for line in $Lines.get_children():
        if line.has_method("_caught"):
            $Path2D/Player.connect("caught", line, "_caught")


func _draw():
    draw_polyline($Path2D.get_curve().get_baked_points(), Color(1, 1, 1, 0.65), 3, true)


func _finished():
    LevelManager.next()


func _caught():
    if coins == 0:
        $Win.play()


func _collected():
    coins -= 1


func _input(event):
    if Input.is_action_just_pressed("ui_cancel"):
        get_tree().reload_current_scene()
