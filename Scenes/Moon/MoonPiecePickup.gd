extends Node2D

signal picked_up(piece_number)

export var number : int

func _on_Area2D_area_entered(area):
	emit_signal("picked_up", number)
	queue_free()
