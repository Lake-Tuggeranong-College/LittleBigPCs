extends RigidBody


export var min_speed = 0.1
export var ball_name = ""
export var mat = preload("res://_MyContent/Materials/Metal.tres")

func _ready():
	mass = Global.Mass
	$MeshInstance.set_surface_material(0,mat)

func dropped():
	$Timer.start()


func _on_Timer_timeout():
	if linear_velocity.x <= min_speed and linear_velocity.x <= min_speed and linear_velocity.z <= min_speed:
		get_parent().respawn_ball(self)
		$Timer.stop()

