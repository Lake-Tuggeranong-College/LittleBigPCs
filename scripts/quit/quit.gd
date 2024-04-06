extends Node


func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	if body is XRToolsPlayerBody:
		get_tree().quit()
