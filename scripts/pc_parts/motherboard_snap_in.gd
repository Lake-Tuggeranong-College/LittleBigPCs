extends XRToolsInteractableBody


onready var highlight_motherboard_mesh = get_node("Motherboard")


func _on_MotherboardBodySnapIn_pointer_entered():
	highlight_motherboard_mesh.visible = true
#	print("This is the snap for Motherboard.")


func _on_MotherboardBodySnapIn_pointer_exited():
	highlight_motherboard_mesh.visible = false
#	print("No snap indicated for Motherboard.")
