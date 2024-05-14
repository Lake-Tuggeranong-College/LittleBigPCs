extends XRToolsInteractableBody


onready var highlight_gpu_mesh = get_node("GPU")


func _on_GPUBodySnapIn_pointer_entered():
	highlight_gpu_mesh.visible = true
#	print("This is the snap for GPU.")


func _on_GPUBodySnapIn_pointer_exited():
	highlight_gpu_mesh.visible = false
#	print("No snap indicated for GPU.")
