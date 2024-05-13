extends XRToolsInteractableBody


onready var hightlight_panel_mesh = get_node("Panel")
onready var hightlight_gpu_mesh = get_node("GPU")
onready var hightlight_motherboard_mesh = get_node("Motherboard")
onready var hightlight_cpu_mesh = get_node("CPU")
onready var hightlight_fan_mesh = get_node("FanModel")
onready var hightlight_hhd_mesh = get_node("HHDModel")
onready var hightlight_power_supply_mesh = get_node("PowerSupplyModel")
onready var hightlight_ram_mesh = get_node("RAMModel")


func _on_PanelBodySnapIn_pointer_entered():
	hightlight_panel_mesh.visible = true
#	print("This is the snap for Panel.")

func _on_PanelBodySnapIn_pointer_exited():
	hightlight_panel_mesh.visible = false
#	print("No snap indicated for Panel.")

func _on_GPUBodySnapIn_pointer_entered():
#	print("This is the snap for GPU.")
	pass


func _on_GPUBodySnapIn_pointer_exited():
#	print("No snap indicated for GPU.")
	pass


func _on_MotherboardBodySnapIn_pointer_entered():
#	print("This is the snap for Motherboard.")
	pass


func _on_MotherboardBodySnapIn_pointer_exited():
#	print("No snap indicated for Motherboard.")
	pass


func _on_CPUBodySnapIn_pointer_entered():
#	print("This is the snap for CPU.")
	pass


func _on_CPUBodySnapIn_pointer_exited():
#	print("No snap indicated for CPU.")
	pass


func _on_FanBodySnapIn_pointer_entered():
#	print("This is the snap for Fan.")
	pass


func _on_FanBodySnapIn_pointer_exited():
#	print("No snap indicated for Fan.")
	pass


func _on_HHDBodySnapIn_pointer_entered():
#	print("This is the snap for HHD.")
	pass


func _on_HHDBodySnapIn_pointer_exited():
#	print("No snap indicated for HHD.")
	pass


func _on_PowerSupplyBodySnapIn_pointer_entered():
#	print("This is the snap for Power Supply.")
	pass


func _on_PowerSupplyBodySnapIn_pointer_exited():
#	print("No snap indicated for Power Supply.")
	pass


func _on_RAMBodySnapIn_pointer_entered():
#	print("This is the snap for RAM.")
	pass


func _on_RAMBodySnapIn_pointer_exited():
#	print("No snap indicated for RAM.")
	pass
