extends KinematicBody2D

signal resetting()

var max_lifetime = 8.0
var lifetime = 0.0
export var left = false
export var speed : int = 5

onready var start = get_position()
onready var shape = $CollisionShape2D

var fired = false

var velocity = Vector2(speed, speed)

func _ready():
	lifetime = 0.0
	#shape.disabled = true

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
	shape.disabled = false

func reset():
	set_position(start)
	shape.disabled = true
	visible = false
	fired = false
