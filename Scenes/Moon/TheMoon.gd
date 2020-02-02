extends Node2D

signal moon_anim_finished

onready var active_pieces = []

onready var level = get_parent()

func _on_piece_collected(piece_number : int):
	if active_pieces.has(piece_number):
		return
	var index = piece_number - 1
	var camera = level.get_node("Player/Camera")
	level.get_node("Player").remove_child(camera)
	add_child(camera)
	show_piece(index)
	yield(self, "moon_anim_finished")
	remove_child(camera)
	level.get_node("Player").add_child(camera)
	

func show_piece(index):
	get_child(index).get_node("AnimationPlayer").play("fade in")
	yield(get_child(index).get_node("AnimationPlayer"), "animation_finished")
	emit_signal("moon_anim_finished")
