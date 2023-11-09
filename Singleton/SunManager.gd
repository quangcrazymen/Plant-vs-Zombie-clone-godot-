extends Node

class_name SunManager

var sun_gathered :int = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_sun_clicked.connect(on_sun_clicked)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_sun_clicked():
	sun_gathered+=25
	print("current sun :%d" % [sun_gathered])
