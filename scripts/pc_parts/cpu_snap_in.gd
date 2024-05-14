extends XRToolsInteractableBody


onready var highlight_cpu_mesh = get_node("CPU")


func _on_CPUBodySnapIn_pointer_entered():
	highlight_cpu_mesh.visible = true
#	print("This is the snap for CPU.")


func _on_CPUBodySnapIn_pointer_exited():
	highlight_cpu_mesh.visible = false
#	print("No snap indicated for CPU.")
