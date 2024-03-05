extends Spatial


var speed = 30
var bomb = preload("res://_MyContent/Scenes/Roboto_Bomb.tscn")

func _ready():
	pass

func _physics_process(delta):
	$Body.rotation_degrees.y += speed * delta
#	if $Body.rotation_degrees.y >= 53 and $Body.rotation_degrees <= 126:
#		$Body.rotation_degrees.y = 127
	pass


func pause_movement(time):
	$Pause.wait_time = time
	$Pause.start()
	set_physics_process(false)

func resume_movement():
	set_physics_process(true)


func spawn_bomb():
	$Bomb_Path.rotation_degrees.y = $Body.rotation_degrees.y
	var bomb_spawn = bomb.instance()
	$Bomb_Path.add_child(bomb_spawn)
	pause_movement(2)



func _on_Timer_timeout():
	spawn_bomb()


func _on_Area_body_entered(body):
	if body.name == "Portal":
		$Body.rotation_degrees.y += 75
