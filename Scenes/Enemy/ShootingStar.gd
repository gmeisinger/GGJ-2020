extends KinematicBody2D

signal resetting()

var max_lifetime = 8.0
var lifetime = 0.0
export var left = false
export var speed : int = 5

onready var start = get_position()

var fired = false

var velocity = Vector2(speed, speed)

func _ready():
	lifetime = 0.0

func _physics_process(delta):
	if fired:
		lifetime += delta
		if lifetime > max_lifetime:
			reset()
		var collision = move_and_collide(velocity)
		#if collision:
			#reset()

func set_left(l):
	left = l
	if left:
		velocity.x *= -1

func fire():
	fired = true
	visible = true

func reset():
	set_position(start)
	visible = false
	fired = false
