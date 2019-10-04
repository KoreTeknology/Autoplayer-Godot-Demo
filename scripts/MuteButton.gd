extends Button

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:

var bus_is_muted = false


func _on_MuteButton_toggled(button_pressed: bool) -> void:
#	bus_is_muted = true
#	if bus_is_muted.true:
#		AudioServer.set_bus_mute(0. true)
	
	AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
	
	
#	var mute = set_bus_mute(0. true)
#	mute.stream_paused = is_pressed()
