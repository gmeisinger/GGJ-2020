extends Control

export(String, FILE, "*.tscn") var next

func _input(event):
	if event is InputEventKey:
		if next:
			transitionMgr.transitionTo(next)
