extends Control

export(String, FILE, "*.tscn") var next_scene

func _ready():
	var os_name = OS.get_name()
	if os_name == 'HTML5':
		$buttons/Quit.hide()
	$buttons/Play.grab_focus()

func _on_Play_button_up():
	transitionMgr.transitionTo(next_scene)


func _on_Quit_button_up():
	get_tree().quit()
