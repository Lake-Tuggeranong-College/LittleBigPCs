extends XRToolsInteractableBody


onready var highlight_power_supply_mesh = get_node("PowerSupplyModel")


func _on_PowerSupplyBodySnapIn_pointer_entered():
	highlight_power_supply_mesh.visible = true
#	print("This is the snap for Power Supply.")


func _on_PowerSupplyBodySnapIn_pointer_exited():
	highlight_power_supply_mesh.visible = false
#	print("No snap indicated for Power Supply.")
