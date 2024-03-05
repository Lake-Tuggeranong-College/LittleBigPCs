extends KinematicBody2D


const UP = Vector2(0,-1)
const FLAP = 200 * 5
const MAXFALLSPEED = 200 * 5
const GRAVITY = 10 * 5

var motion = Vector2()

var points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):

	motion.y += GRAVITY
	if motion.y >= MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_just_pressed("Test"):
		flap()
	
	motion = move_and_slide(motion, UP)

func flap():
	motion.y = -FLAP


func _on_Area2D_body_entered(body):
	if body.is_in_group("Wall"):
		reset()

func reset():
# Reset Walls
	print("Reset")
	get_parent().get_child(3).position.x = 1979 
	get_parent().get_child(4).position.x = 3319

	points = 0
	change_points()

func change_points():
	get_parent().get_child(1).text = str(points)
	if points == 3:
		get_parent().get_parent().get_parent().finish()
