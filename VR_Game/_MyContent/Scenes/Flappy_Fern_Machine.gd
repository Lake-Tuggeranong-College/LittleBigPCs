extends Spatial


func Press():

	if $Viewport.get_child_count() != 0:
		$Viewport/Player.get_child(2).flap()

func finish():
	$AnimationPlayer.play("Finish")
	$Viewport.queue_free()
	$Viewport/Player.pause_mode = PAUSE_MODE_STOP
	if Global.tickets[2] == 0:
		get_parent().add_tickets(10)
		Global.tickets[2] = 1
