extends XRToolsInteractableBody


onready var highlight_ram_mesh = get_node("RAMModel")


func _on_RAMBodySnapIn_pointer_entered():
	highlight_ram_mesh.visible = true
#	print("This is the snap for RAM.")


func _on_RAMBodySnapIn_pointer_exited():
	highlight_ram_mesh.visible = false
#	print("No snap indicated for RAM.")
