extends Node2D

const VU_COUNT=1
const FREQ_MAX = 11050.0

const WIDTH = 10
const HEIGHT = 240

const MIN_DB = 60

const VUE_DB_STEP2 = 20
const VUE_DB_STEP3 = 10

var blue = Color(0,0,0.7,0.6)


var spectrum

func _draw():
		
	var w = WIDTH / VU_COUNT
	var prev_hz = 0
	for i in range(1,VU_COUNT+1):	
		var hz = i * FREQ_MAX / VU_COUNT;
		var f = spectrum.get_magnitude_for_frequency_range(prev_hz,hz)
		var energy = clamp((MIN_DB + linear2db(f.length()))/MIN_DB,0,1)
		#print("db ",db,": ",f.length())
		var height = energy * HEIGHT
		
		# TODO change color condition to db
		#print (height)
		
		draw_rect(Rect2(w*i,HEIGHT-height,w-1,height),blue)
		
			
		prev_hz = hz
		
		
	

func _process(delta):
	#print (Performance.get_monitor(27))
	
	
	
	
	update()

func _ready():
	spectrum = AudioServer.get_bus_effect_instance(0,0)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
