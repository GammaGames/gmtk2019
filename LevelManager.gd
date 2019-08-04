extends Node2D

var levels = ["2", "3", "4", "5", "6", "7", "8", "9"]
var current = "1"

func next():
    if levels.size():
        current = levels.pop_front()
        get_tree().change_scene("res://levels/{0}.tscn".format({0: current}))
    else:
        get_tree().change_scene("res://levels/Credits.tscn")
