extends Area2D

# DOES PANNING !
export var init_pan = 0

# Calculate rotation var
var start_pos = Vector2()
var start_rot

var min_rot = 0
var max_rot = 270 # all rotation movement

var sensitivity = 1.5 # higher = more sensitive

func _ready():
	set_process(false)
	#start_rot = 135


func _on_panknob_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		start_pos = get_global_mouse_position()
		start_rot = $top.rotation_degrees
		
		set_process(true)

# the magic happend
func _process(delta):
	var distance = start_pos - get_global_mouse_position()
	var knob_rot = start_rot + distance.y * sensitivity # change distance.y to distance.x for horizontal control
	
	if knob_rot < min_rot:
		knob_rot = min_rot
	elif knob_rot > max_rot:
		knob_rot = max_rot
		
	# get the rotation value in degree
	$top.rotation_degrees = knob_rot
	
	# SET panning VALUE
	#var value = (knob_rot-50)/3
	var valtem = lerp(-50, 50, knob_rot/270.0)
	
	var audvol = AudioServer
	var pan = audvol.get_bus_effect(AudioServer.get_bus_index("track"),1)
	pan.pan = valtem
	
	
	
	
	
	# a = lerp(-80, 0, b/270.0)
#	var valtem = lerp(-80, 0, knob_rot/270.0)
	# autre solution: a = range_lerp(0, 270, b, -80, 0)
	#$Label4.text = str(round(valtem))+" db"
	
	
	if Input.is_action_just_released("click"):
		set_process(false)

