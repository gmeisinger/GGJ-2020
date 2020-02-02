extends Node2D

var reset_time = 5.0
var ready = true

onready var star = load("res://Scenes/Enemy/ShootingStar.tscn")
export var left : bool

func _ready():
	$ShootingStar.set_left(left)
	$ShootingStar.visible = false

func _on_trigger_body_entered(body):
	if ready:
		ready = false
		$reset_timer.start(reset_time)
		$ShootingStar.fire()


func _on_reset_timer_timeout():
	$ShootingStar.reset()
	ready = true


func _on_ShootingStar_resetting():
	ready = false
	$reset_timer.start(reset_time)
