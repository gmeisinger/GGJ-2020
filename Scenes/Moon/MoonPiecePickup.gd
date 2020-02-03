extends Node2D

export (int) var index
var moon_piece_trail = preload("res://Scenes/Moon/CollectedMoonPiece.tscn")
var has_been_hit = false
var INCREMENT = 0.002
var player
var the_moon

func _ready():
	player = get_parent().get_node('Player')
	the_moon = get_parent().get_node('TheMoon')


func _on_Area2D_area_entered(area):
	if has_been_hit: return
	if area.name == 'hitbox':
		player.get_node('stateMachine').change_state('collected')
		has_been_hit = true
		# tell player to change state?
		$Sprite.hide()
		$Path2D/PathFollow2D/MoonCollectedParticle.show()
		player.get_node("Camera").current = false
		$Path2D/PathFollow2D/MoonCollectedParticle/Camera2D.current = true
		$Path2D/PathFollow2D.unit_offset = 0
		var x = 0 
		while (x < 1):
			x += INCREMENT
			$Path2D/PathFollow2D.unit_offset += INCREMENT
			yield(get_tree(), 'idle_frame')
		
		# end of path hide and play moon piece animation
		$Path2D/PathFollow2D/MoonCollectedParticle.hide()

		var moon_piece = the_moon.get_child(index)
		var moon_anim = moon_piece.get_node('AnimationPlayer')
		moon_anim.play('fade in')
		yield(moon_anim, 'animation_finished')
		_on_moon_piece_complete()

func _on_moon_piece_complete():
	$Path2D/PathFollow2D/MoonCollectedParticle/Camera2D.current = false
	player.get_node("Camera").current = true
	player.get_node('stateMachine').change_state('moving')
	
