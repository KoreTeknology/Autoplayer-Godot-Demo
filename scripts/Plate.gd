extends Sprite

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

# Theme change
var light_texture = preload("res://images/plate.png")
var dark_texture = preload("res://images/plate_dark.png")
var dark_cap = preload("res://images/knob_bottom_dark.png")
var light_cap = preload("res://images/knob_bottom.png")
onready var capknob = get_node("/root/Node/knob/Cap")
onready var t1 = get_node("/root/Node/knob/Label")
onready var t2 = get_node("/root/Node/knob/Label2")
onready var t3 = get_node("/root/Node/knob/Label3")
onready var t4 = get_node("/root/Node/knob/Label4")

func _input(ev):
	if Input.is_key_pressed(KEY_D):
		self.texture = dark_texture

		capknob.texture = dark_cap
		t1.set("custom_colors/font_color",Color(1,1,1))
		t2.set("custom_colors/font_color",Color(1,1,1))
		t3.set("custom_colors/font_color",Color(1,1,1))
		t4.set("custom_colors/font_color",Color(1,1,1))

	if Input.is_key_pressed(KEY_L):
		self.texture = light_texture
		
		capknob.texture = light_cap
		t1.set("custom_colors/font_color",Color(0,0,0))
		t2.set("custom_colors/font_color",Color(0,0,0))
		t3.set("custom_colors/font_color",Color(0,0,0))
		t4.set("custom_colors/font_color",Color(0,0,0))
		
		