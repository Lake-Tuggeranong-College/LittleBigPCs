extends Spatial


export var text = ""


func _ready():
	$TextViewport/Label.text = text



func Press():
	$Idle.hide()
	$Text.show()
	$TextTimer.start()


func _on_TextTimer_timeout():
	$Idle.show()
	$Text.hide()
