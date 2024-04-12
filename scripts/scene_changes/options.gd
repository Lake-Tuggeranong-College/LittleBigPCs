extends Area


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	if body is XRToolsPlayerBody:
		get_tree().change_scene("res://scenes/start/options_pop_up.tscn")
