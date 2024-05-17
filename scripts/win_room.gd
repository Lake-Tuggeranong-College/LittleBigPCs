extends Spatial


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
		get_tree().change_scene("res://scenes/start/start_room.tscn")
#		print("Transfer player to the win room.")
