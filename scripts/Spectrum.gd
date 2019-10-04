extends Node2D

const VU_COUNT=1
const FREQ_MAX = 11050.0

const WIDTH = 10
const HEIGHT = 240

const MIN_DB = 60

const VUE_DB_STEP2 = 20
const VUE_DB_STEP3 = 10

var vueColorBase = Color(0.2,0.6,0.1,0.9)
var vuecolor2 = Color(0.9, 0.8, 0,0.9)
var vuecolor3 = Color(1,0,0,0.9)

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
		if height > 160:
			draw_rect(Rect2(w*i,HEIGHT-height,w-1,height),vuecolor3)
		elif height > 90:
			draw_rect(Rect2(w*i,HEIGHT-height,w-1,height),vuecolor2)
		else:
			draw_rect(Rect2(w*i,HEIGHT-height,w-1,height),vueColorBase)
			
		prev_hz = hz

func _process(delta):
	update()

func _ready():
	spectrum = AudioServer.get_bus_effect_instance(0,0)

