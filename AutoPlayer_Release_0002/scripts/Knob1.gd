extends Area2D

var start_pos = Vector2()
var start_rot



var min_rot = 0
var max_rot = 160
var sensitivity = 0.5 # higher = more sensitive

func _ready():
	set_process(false)


func _on_Knob1_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		start_pos = get_global_mouse_position()
		start_rot = $Sprite.rotation_degrees
		
		set_process(true)


func _process(delta):
	var distance = start_pos - get_global_mouse_position()
	var knob_rot = start_rot + distance.y * sensitivity # change distance.y to distance.x for horizontal control
	
	if knob_rot < min_rot:
		knob_rot = min_rot
	elif knob_rot > max_rot:
		knob_rot = max_rot
		
	$Sprite.rotation_degrees = knob_rot
	$Label.text = str(round(knob_rot))
	
	#var value = 0
	var audvol = AudioServer
	var value = knob_rot-80
	audvol.set_bus_volume_db(1,value)
	#$AudioStreamPlayer.volume_db = str(round(knob_rot))
	
	if Input.is_action_just_released("click"):
		set_process(false)