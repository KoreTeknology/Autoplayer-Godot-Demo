extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ResetPanButton_pressed():
	var calrot = 135
	self.rotation_degrees = calrot
	
	var audvol = AudioServer
	var pan = audvol.get_bus_effect(AudioServer.get_bus_index("track"),1)
	pan.pan = 0
	
