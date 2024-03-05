extends PathFollow

var speed = 0.3

func _ready():
	unit_offset = 1
	$Bomb.interact()
	set_physics_process(true)


func _physics_process(delta):
	if unit_offset >= 0.001:
		unit_offset -= speed * delta
	else:
		$Bomb.mode = RigidBody.MODE_STATIC
		set_physics_process(false)
		$Bomb.mode = RigidBody.MODE_RIGID
