extends SpotLight

export var flicker = true

func _ready():
	if flicker == true:
		randomize()
		$Timer.wait_time = rand_range(20,80)
		$Timer.start()

func flicker():
	$AudioStreamPlayer3D.play()
	$AnimationPlayer.play("Flicker")


func _on_Timer_timeout():
	flicker()
