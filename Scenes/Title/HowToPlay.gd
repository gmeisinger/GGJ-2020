extends Control

var title = "res://Scenes/Title/Title.tscn"

func _input(event):
	if event is InputEventKey:
		transitionMgr.transitionTo(title)
