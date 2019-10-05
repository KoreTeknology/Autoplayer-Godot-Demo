extends Area2D

# Values in inspector
export var input_channel = "Main"
export var output_bus = "track1"

# Calculate rotation var
var start_pos = Vector2()
var start_rot

var min_rot = 0
var max_rot = 270 # 360 - 90

var sensitivity = 1.5 # higher = more sensitive


func _ready():
	set_process(false)

# rotate background sprite
func _on_knob_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		start_pos = get_global_mouse_position()
		start_rot = $bg.rotation_degrees
		
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
	$bg.rotation_degrees = knob_rot
	
	var pbval = knob_rot / 2.7
	$ProgressBar.value = pbval
	
	# try to get the scale
	var divider = 3.3
	#var dbvalue_updated = (knob_rot / divider)
	var dbvalue_updated = (knob_rot - 80) / 3.3
	
	# SET volume VALUE
	var value = (knob_rot-80)/3
	
	var audvol = AudioServer
	
	audvol.set_bus_volume_db(1,value)
	
	# the text shows the degree final value, check
	$Label3.text = str(knob_rot)+" °"
	
	# a = lerp(-80, 0, b/270.0)
	var valtem = lerp(-80, 0, knob_rot/270.0)
	# autre solution: a = range_lerp(0, 270, b, -80, 0)
	$Label4.text = str(round(valtem))+" db"
	
	
	if Input.is_action_just_released("click"):
		set_process(false)

# pour inverser une valeur: a = 100-b