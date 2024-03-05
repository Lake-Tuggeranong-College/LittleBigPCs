extends Spatial


var targets
var blue_targets
var last_shot_target

onready var timer = $"Flipping Timer"

func _ready():
	randomize()
	targets = $Targets.get_children()
	blue_targets = $Targets.get_children()

	timer.start()



func _on_Flipping_Timer_timeout():
	flip_target()


func flip_target():
	if blue_targets:
		blue_targets.shuffle()
		var chosen_target = blue_targets[0]
		if chosen_target.target_number == last_shot_target:
			last_shot_target = -1
			flip_target()
			return
		blue_targets.erase(chosen_target)
		if chosen_target.active_color == "Blue":
			chosen_target.flip_to_red()

func add_blue_target(target_number):
	blue_targets.append(targets[target_number])
	last_shot_target = target_number
