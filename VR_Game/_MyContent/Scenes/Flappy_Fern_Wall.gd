extends StaticBody2D


var speed = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position += Vector2(-speed,0)
	if position.x <= -150:
		reset_wall()

func reset_wall():
	position.x = 1950
	position.y = rand_range(100,770)


func _on_Point_Area_body_entered(body):
	if body.name == "Player":
		print("Point")
		body.points += 1
		body.change_points()
