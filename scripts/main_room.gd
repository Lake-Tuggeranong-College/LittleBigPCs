extends Spatial


onready var panel_snap_area = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/PanelSnapZone")
onready var pickable_panel = get_node("StadablePlatform/PlaceableTable2/X_Neg_PC_Parts_table_Cube/PickablePanel")
onready var scaled_panel = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/PanelSnapZone/PanelModel")


onready var power_supply_snap_area = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/PowerSupplySnapZone")
onready var pickable_power_supply = get_node("StadablePlatform/PlaceableTable2/X_Neg_PC_Parts_table_Cube/PickablePowerSupply")
onready var scaled_power_supply = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/PowerSupplySnapZone/PowerSupplyModel")


onready var ram_snap_area = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/RAMSnapZone")
onready var pickable_ram = get_node("StadablePlatform/PlaceableTable2/X_Neg_PC_Parts_table_Cube/PickableRAMs")
onready var scaled_ram = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/RAMSnapZone/RAMModel")


onready var gpu_snap_area = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/GPUSnapZone")
onready var pickable_gpu = get_node("StadablePlatform/PlaceableTable2/X_Neg_PC_Parts_table_Cube/PickableGPU")
onready var scaled_gpu = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/GPUSnapZone/GPUModel")


onready var motherboard_snap_area = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/MotherBoardSnapZone")
onready var pickable_motherboard = get_node("StadablePlatform/PlaceableTable3/X_Pos_PC_Parts_table_Cube/PickableMotherboard")
onready var scaled_motherboard = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/MotherBoardSnapZone/MotherBoardModel")


onready var fan_snap_area = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/FanSnapZone")
onready var pickable_fan = get_node("StadablePlatform/PlaceableTable3/X_Pos_PC_Parts_table_Cube/PickableFans")
onready var scaled_fan = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/FanSnapZone/FanModel")


onready var cpu_snap_area = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/CPUSnapZone")
onready var pickable_cpu = get_node("StadablePlatform/PlaceableTable3/X_Pos_PC_Parts_table_Cube/PickableCPU")
onready var scaled_cpu = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/CPUSnapZone/CPUModel")


onready var hhd_snap_area = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/HHDSnapZone")
onready var pickable_hhd = get_node("StadablePlatform/PlaceableTable3/X_Pos_PC_Parts_table_Cube/PickableHHD")
onready var scaled_hhd = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/HHDSnapZone/HHDModel")


onready var scene_change_area = get_node("StadablePlatform/DoorTriggerArea")
export var required_snap_pc_part: int = 8
export var counted_snap_pc_part: int = 0


func _on_Win_condition():
	if counted_snap_pc_part == required_snap_pc_part:
		scene_change_area.visible = true
	else:
		scene_change_area.visible = false


func _on_DoorTriggerArea_body_entered(body):
	_on_Win_condition()
	
	if body.name == "PlayerBody":
		var door_trigger_animation = get_node("StadablePlatform/DoorTriggerArea/DoorOpenAnimation")
		door_trigger_animation.play("open_door")
		
		var scene_change = get_node("StadablePlatform/DoorTriggerArea/SceneChangeDoor")
		scene_change.visible = true
#		print("Player has entered the door zone.")


func _on_DoorTriggerArea_body_exited(body):
	if body.name == "PlayerBody":
		var door_trigger_animation = get_node("StadablePlatform/DoorTriggerArea/DoorOpenAnimation")
		door_trigger_animation.play("close_door")
		
		var scene_change = get_node("StadablePlatform/DoorTriggerArea/SceneChangeDoor")
		scene_change.visible = false
#		print("Player has left the door zone.")


func _on_SceneChangeDoor_body_entered(body):
	if body.name == "PlayerBody":
		get_tree().change_scene("res://scenes/win/win_room.tscn")
#		print("Transfer player to the win room.")


func _on_PickablePanel_picked_up(pickable):
	panel_snap_area.visible = true


func _on_PickablePanel_dropped(pickable):
	panel_snap_area.visible = false


func _on_PanelSnapZone_body_entered(body):
	pickable_panel.visible = false
	scaled_panel.visible = true
	
	counted_snap_pc_part += 1
	print("Counted: ", counted_snap_pc_part)
	_on_Win_condition()
	print("Checked.", _on_Win_condition())


func _on_PanelSnapZone_body_exited(body):
	pickable_panel.visible = true
	scaled_panel.visible = false


func _on_PickablePowerSupply_picked_up(pickable):
	power_supply_snap_area.visible = true


func _on_PickablePowerSupply_dropped(pickable):
	power_supply_snap_area.visible = false


func _on_PowerSupplySnapZone_body_entered(body):
	pickable_power_supply.visible = false
	scaled_power_supply.visible = true
	
	counted_snap_pc_part += 1
	print("Counted: ", counted_snap_pc_part)
	_on_Win_condition()
	print("Checked.", _on_Win_condition())


func _on_PowerSupplySnapZone_body_exited(body):
	pickable_power_supply.visible = true
	scaled_power_supply.visible = false


func _on_PickableRAMs_picked_up(pickable):
	ram_snap_area.visible = true


func _on_PickableRAMs_dropped(pickable):
	ram_snap_area.visible = false


func _on_RAMSnapZone_body_entered(body):
	pickable_ram.visible = false
	scaled_ram.visible = true
	
	counted_snap_pc_part += 1
	print("Counted: ", counted_snap_pc_part)
	_on_Win_condition()
	print("Checked.", _on_Win_condition())


func _on_RAMSnapZone_body_exited(body):
	pickable_ram.visible = true
	scaled_ram.visible = false


func _on_PickableGPU_picked_up(pickable):
	gpu_snap_area.visible = true


func _on_PickableGPU_dropped(pickable):
	gpu_snap_area.visible = false


func _on_GPUSnapZone_body_entered(body):
	pickable_gpu.visible = false
	scaled_gpu.visible = true
	
	counted_snap_pc_part += 1
	print("Counted: ", counted_snap_pc_part)
	_on_Win_condition()
	print("Checked.", _on_Win_condition())


func _on_GPUSnapZone_body_exited(body):
	pickable_gpu.visible = true
	scaled_gpu.visible = false


func _on_PickableMotherboard_picked_up(pickable):
	motherboard_snap_area.visible = true


func _on_PickableMotherboard_dropped(pickable):
	motherboard_snap_area.visible = false


func _on_MotherBoardSnapZone_body_entered(body):
	pickable_motherboard.visible = false
	scaled_motherboard.visible = true
	
	counted_snap_pc_part += 1
	print("Counted: ", counted_snap_pc_part)
	_on_Win_condition()
	print("Checked.", _on_Win_condition())


func _on_MotherBoardSnapZone_body_exited(body):
	pickable_motherboard.visible = true
	scaled_motherboard.visible = false


func _on_PickableFans_picked_up(pickable):
	fan_snap_area.visible = true


func _on_PickableFans_dropped(pickable):
	fan_snap_area.visible = false


func _on_FanSnapZone_body_entered(body):
	pickable_fan.visible = false
	scaled_fan.visible = true
	
	counted_snap_pc_part += 1
	print("Counted: ", counted_snap_pc_part)
	_on_Win_condition()
	print("Checked.", _on_Win_condition())


func _on_FanSnapZone_body_exited(body):
	pickable_fan.visible = true
	scaled_fan.visible = false


func _on_PickableCPU_picked_up(pickable):
	cpu_snap_area.visible = true


func _on_PickableCPU_dropped(pickable):
	cpu_snap_area.visible = false


func _on_CPUSnapZone_body_entered(body):
	pickable_cpu.visible = false
	scaled_cpu.visible = true
	
	counted_snap_pc_part += 1
	print("Counted: ", counted_snap_pc_part)
	_on_Win_condition()
	print("Checked.", _on_Win_condition())


func _on_CPUSnapZone_body_exited(body):
	pickable_cpu.visible = true
	scaled_cpu.visible = false


func _on_PickableHHD_picked_up(pickable):
	hhd_snap_area.visible = true


func _on_PickableHHD_dropped(pickable):
	hhd_snap_area.visible = false


func _on_HHDSnapZone_body_entered(body):
	pickable_hhd.visible = false
	scaled_hhd.visible = true
	
	counted_snap_pc_part += 1
	print("Counted: ", counted_snap_pc_part)
	_on_Win_condition()
	print("Checked.", _on_Win_condition())


func _on_HHDSnapZone_body_exited(body):
	pickable_hhd.visible = true
	scaled_hhd.visible = false
