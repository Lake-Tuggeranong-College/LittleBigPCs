extends Spatial


onready var anim = $Enemy/AnimationPlayer
onready var timer = $"Enemy Movement Timer"
onready var final_timer = "Final Movement Timer"

var animation_order = ["Move_Forward","Enter_Hallway_1","Peek_Hallway_1","Enter_Hallway_2","Peek_Hallway_2"]
var animation_number = 4
var animation_played = false
var final_stage = 0
var time_left = 90

func _ready():
	timer.wait_time = rand_range(4.25,10.75)
	timer.start()

#Player activates the flash light
func shine_light(toggled): 

	if toggled == "On":
		update_location()
	elif toggled == "Off":
		resume_timer()



func update_location(): #Play Animation When First Seen
	if timer:
		print(animation_number)
		timer.paused = true
		if animation_number == -1:
			return

		if not animation_number >= 5 and animation_played == false:
			anim.play(animation_order[animation_number])
			animation_played = true
			$Enemy/Run.play()

		elif animation_number == 5:
			if final_stage == 1:
				print ("Sit Down")
				anim.play("Final_1")
				animation_number = 4
			elif final_stage == 2:
				print ("Win")
				anim.play("Final_2")
				timer.queue_free()
				get_tree().change_scene("res://Arcade.tscn")
			elif final_stage == 3:
				jumpscare()

func resume_timer():
	if timer.is_inside_tree():
		timer.paused = false



func _on_Enemy_Movement_Timer_timeout():
	animation_played = false
	if animation_number <= 4:
		print ("Play Animation: ", animation_number)
		timer.wait_time = rand_range(4.25,10.75)
		timer.start()
		animation_number += 1

	elif animation_number == 5:
		print("Final Stage: ", final_stage)
		final_stage += 1
		timer.wait_time = rand_range(0.75,1.75)
		if final_stage == 2:
			timer.wait_time = 5
		timer.start()


func _on_Time_Limit_Timer_timeout(): #Update Timer
	time_left -= 1
	$Viewport/Label.text = str(time_left)



func jumpscare():
	print ("JumpScare")
	get_tree().change_scene("res://_MyContent/Scenes/Flashlight_Game.tscn")
