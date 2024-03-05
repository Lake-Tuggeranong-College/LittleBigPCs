extends Spatial


onready var squares = $Viewport/Squares.get_children()
var current_round = 0

var pins_down_round_one = 0
var pins_down = 0
var total_points = 0
var balls_thrown = 0

var challenge1 = 10
var challenge2 = 20
var challenge3 = 40
var challenge4 = 60

var counter = [0,0,0,0,0,0,0,0,0,0] #counts if the round resulted in a strike or a spare to allow for proper scoring conventions.

var challenge1reset = true
var challenge2reset = true
var challenge3reset = true
var challenge4reset = true

var moved1 = true #Keeps track of weather the floors should change position
var moved2 = false
var moved3 = true
var moved4 = false
var moved5 = true
var moved6 = false

func _ready():
	$Barriers.translate(Vector3(0,0,-10)) #Move the barriers (For a challenge)
	$Barriers2.translate(Vector3(0,0,-10))

 
func _on_Pin_Respawn_Delay_timeout():
	reset_pins()

func reset_pins():
	$AnimationPlayer.play("RESET")
	balls_thrown = 0

	for x in $Pins.get_children():
		x.sleeping = true

	if total_points >= 100:
		if Global.tickets[1] == 0:
			get_parent().add_tickets(10)
		Global.tickets[1] = 1 #So the player can't farm points

	print("Total Score: ", total_points)
	if total_points >= challenge1: #Remove Guard Rails
		print ("Challange 1")
		if challenge1reset == false: #To stop the floor continuosly moving down each pin hit
			if moved2 == false:
				$Bumper.translate(Vector3(0,0,-10)) #change to translation, then reset when points are below
				$Bumper2.translate(Vector3(0,0,-10)) 
				challenge1reset = true
				moved2 = true
				moved1 = false
			else:
				pass
		else:
			pass
	else:
		print ("challenge 1 reset")
		if challenge1reset == true:
			if moved1 == false:
				$Bumper.translate(Vector3(0,0,10)) #Reset the bumpers so that when the points reset the player restarts the challenges
				$Bumper2.translate(Vector3(0,0,10))
				challenge1reset = false
				moved2 = false
				moved1 = true
			else:
				pass
		else:
			pass
	if total_points >= challenge2: #Sloped playing field
		print ("Challange 2") #Have two different floors that swap places
		if challenge2reset == false:
			if moved4 == false:
				$Floor.translate(Vector3(0,0,-10)) #Swapping out floors, tesselating them down in this one
				challenge2reset = true
				moved4 = true
				moved5 = false
			else:
				pass
		else:
			pass
	else:
		if challenge2reset == true:
			if moved5 == false:
				$Floor.translate(Vector3(0,0,10)) #Returning the floor to its location
				challenge2reset = false
				moved5 = true
				moved6 = false
			else:
				pass
		else:
			pass
	if total_points >= challenge3: # Ball goes lighter (harder to bowl)
		print ("Challange 3")
		Global.Mass = 0.5
		challenge3reset = true
	else:
		if challenge3reset == true:
			Global.Mass = 1
			challenge3reset = false
		else:
			pass
	if total_points >= challenge4: #Barriers
		if moved6 == false:
			$Barriers.translate(Vector3(0,0,10)) #change from translate to translation to free up multiple lines of code
			$Barriers2.translate(Vector3(0,0,10)) #adds barriers to the game to force the player to aim where they throw the ball
			challenge3reset = true
			moved6 = true
			moved5 = false
		else:
			pass
	else:
		if challenge3reset == true:
			if moved5 == false:
				$Barriers.translate(Vector3(0,0,-10))
				$Barriers2.translate(Vector3(0,0,-10))
				moved5 = true
				moved6 = false
			else:
				pass
		else:
			pass


func count_pins():
	for x in $Pins.get_children():
		x.sleeping = true
		var y = x.get_children()
		var z = y[2]
		if z.global_transform.origin.y <= 0.6:
			pins_down += 1

	if current_round > 10: # Reset the round so the player can earn the required points if failed
		
		
		current_round = 0 #Resets round

	var current_square = squares[current_round] #Used to edit scores on game board
	var a = current_square.get_children()
	var d = squares[current_round-1].get_children()
	var e = squares[current_round-2].get_children()

	if balls_thrown == 1: #After First Throw
		var b = a[0]
		b.text = str(pins_down)
		pins_down_round_one = pins_down
		if pins_down == 10: #Strike
			current_round += 1
			var c = a[1]
			c.text = str("X")
			a[2].text = str("10")
			reset_pins()
			counter[current_round] == 2
			if counter[current_round-1] == 1 : #Detect spare
				counter[current_round-1] = 0
				total_points += pins_down_round_one #So the spare function can add points
				d[2].text = str(+10) #Update point board
			if counter[current_round-1] == 2 : #Detect Strike
				counter[current_round-1] -= 1
				total_points += pins_down_round_one #Add points gained from getting a strike
				d[2].text = str(+10) #Update point board
			elif counter[current_round-1] == 0:
				pass
			if counter[current_round-2] == 1 : #Getting a strike after a strike still adds points instead of not registering
				counter[current_round-2] = 0
				total_points += pins_down_round_one #Add points
				e[2].text = str(+10) #Update point board
			else:
				pass
		total_points += pins_down
		pins_down = 0
	elif balls_thrown == 2: #After Second Throw
		if pins_down == 10: #spare
			counter[current_round] == 1 #So that the game can detect a spare has occured
		if counter[current_round-1] == 1:
			counter[current_round-1] = 0 #So that game doesn't count twice
			d[2].text = str(+10)
			total_points += (pins_down - pins_down_round_one) #Add points from spare
		else:
			pass
		var b = a[1]
		b.text = str(pins_down - pins_down_round_one)
		var c = a[2]
		c.text = str(pins_down)
		current_round += 1
		total_points += pins_down - pins_down_round_one
		pins_down = 0

	$Viewport/Total.text = str(total_points)



func respawn_ball(ball):
	ball.translation = Vector3(1.221,0.929,0.391)
	count_pins()

	if balls_thrown == 2:
		$"Pin Respawn Delay".start()


func _on_BallDetector_body_entered(body):
	if body.name == "Ball":
		balls_thrown += 1

