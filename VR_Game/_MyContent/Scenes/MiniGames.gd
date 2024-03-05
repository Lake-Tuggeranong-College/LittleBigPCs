extends Spatial

var tickets = 0

func add_tickets(amount):
	tickets += amount
	if tickets == 3:
		pass


func Press():
	get_tree().change_scene("res://_MyContent/Scenes/Flashlight_Game.tscn")
