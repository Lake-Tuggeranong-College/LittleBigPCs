extends RigidBody

onready var light = $SpotLight
onready var raycast = $RayCast

var light_on = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func interact():
	if light_on == false:
		light.light_energy = 1
		light_on = true
		if get_parent().name == "FlashlightGame":
			get_parent().shine_light("On")
	elif light_on == true:
		light.light_energy = 0
		light_on = false
		if get_parent().name == "FlashlightGame":
			get_parent().shine_light("Off")




	# Update the raycast and see if it has collided with anything
	raycast.force_raycast_update()
	if raycast.is_colliding():
		
		# Get whatever the raycast collided with
		var body = raycast.get_collider()
		if body.has_method("Shine"):
			body.shine()
