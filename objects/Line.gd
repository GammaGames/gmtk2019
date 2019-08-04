extends StaticBody2D

onready var audio = $AudioStreamPlayer2D

func play():
    audio.play()
