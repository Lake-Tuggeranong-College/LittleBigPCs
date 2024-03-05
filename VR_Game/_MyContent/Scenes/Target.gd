extends KinematicBody

export var target_number = 0

var active_color = "Blue"



func damage(_x,_y):
	if active_color == "Red": #Shot When Red
		flip_to_blue() 

func flip_to_red(): #Blue To Red
	active_color = "Red" #Disable Being Shot
	$AnimationPlayer.play("Flip To Red",1)

func flip_to_blue():
	active_color = "Blue"
	$AnimationPlayer.play("Flip To Blue",1)
	get_parent().get_parent().add_blue_target(target_number)

