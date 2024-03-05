extends Spatial


func Press():
	print ("Press")
	if not $AudioStreamPlayer3D.playing:
		$AudioStreamPlayer3D.play()
	else:
		$AudioStreamPlayer3D.stop()
