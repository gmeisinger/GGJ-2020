extends KinematicBody2D

var walk_speed = 100.0
var gravity = 100.0

export var go_right = false

onready var velocity = Vector2(-walk_speed, gravity)

func _ready():
	if go_right:
		turn()

func turn():
	velocity.x = -velocity.x
	$Sprite.flip_h = !$Sprite.flip_h
	$RayCast2D.cast_to.x *= -1

func _physics_process(delta):
	#check on floor
	#$RayCast2D.force_raycast_update()
	if not $RayCast2D.is_colliding():
		turn()
	move_and_slide(velocity, Vector2.UP)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
