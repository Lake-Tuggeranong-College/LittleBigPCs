extends XRToolsInteractableBody


onready var highlight_fan_mesh = get_node("FanModel")


func _on_FanBodySnapIn_pointer_entered():
	highlight_fan_mesh.visible = true
#	print("This is the snap for Fan.")


func _on_FanBodySnapIn_pointer_exited():
	highlight_fan_mesh.visible = false
#	print("No snap indicated for Fan.")
