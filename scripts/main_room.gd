extends Spatial


onready var panel_snap_area = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/PanelSnapZone")
onready var pickable_panel = get_node("StadablePlatform/PlaceableTable2/X_Neg_PC_Parts_table_Cube/PickablePanel")
onready var scaled_panel = get_node("StadablePlatform/PlaceableTable1/Main Table/Case/PanelSnapZone/PanelModel")


func _on_DoorTriggerArea_body_entered(body):
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
# TODO: Add conditon for winning (Condition: Player finished building the PC Tower).


func _on_PickablePanel_picked_up(pickable):
	panel_snap_area.visible = true


func _on_PickablePanel_dropped(pickable):
	panel_snap_area.visible = false


func _on_PanelSnapZone_body_entered(body):
	pickable_panel.visible = false
	scaled_panel.visible = true


func _on_PanelSnapZone_body_exited(body):
	pickable_panel.visible = true
	scaled_panel.visible = false
