extends XRToolsInteractableBody


onready var highlight_hhd_mesh = get_node("HHDModel")


func _on_HHDBodySnapIn_pointer_entered():
	highlight_hhd_mesh.visible = true
#	print("This is the snap for HHD.")


func _on_HHDBodySnapIn_pointer_exited():
	highlight_hhd_mesh.visible = false
#	print("No snap indicated for HHD.")
