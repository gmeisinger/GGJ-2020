extends Control

export(String, FILE, "*.tscn") var next = "res://Scenes/Title/Title.tscn"

func _input(event):
	if event is InputEventKey:
		transitionMgr.transitionTo(next)
