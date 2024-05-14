extends XRToolsInteractableBody


onready var highlight_panel_mesh = get_node("Panel")


func _on_PanelBodySnapIn_pointer_entered():
	highlight_panel_mesh.visible = true
#	print("This is the snap for Panel.")


func _on_PanelBodySnapIn_pointer_exited():
	highlight_panel_mesh.visible = false
#	print("No snap indicated for Panel.")
