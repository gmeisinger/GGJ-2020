extends "res://Scenes/StateMachine/baseState.gd"

func enter():
	host.play_anim("fall")

func update(delta):
	if host.is_on_floor():
		#$landingSound.play()
		change_state("moving")
		return
	host.process_horizontal_movement(delta)
	host.process_move_and_slide(delta)
